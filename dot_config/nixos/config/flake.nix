{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib.extend (import ./lib);
      inherit (builtins) listToAttrs;
      inherit (lib) genAttrs entryFullNames fileNames;

      eachSystem = genAttrs [ "x86_64-linux" ];

      hostsDir = ./hosts;
      nixosModules = ./nixos-modules;
      packagesDir = ./packages;
    in
    {
      packages = eachSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        listToAttrs (
          map (name: {
            inherit name;
            value = pkgs.buildEnv {
              name = "package-bundle";
              paths = import "${packagesDir}/${name}.nix" pkgs;
            };
          }) (fileNames packagesDir)
        )
      );
      nixosConfigurations = listToAttrs (
        map (
          name:
          let
            hostName = "nixos-${name}";
          in
          {
            name = hostName;
            value = nixpkgs.lib.nixosSystem {
              inherit lib;
              specialArgs = {
                inputs = inputs // {
                  nixpkgs-overlays = ./overlays/default.nix;
                };
              };
              modules = [
                {
                  networking = { inherit hostName; };
                }
                nixosModules
                "${hostsDir}/${name}/config.nix"
              ];
            };
          }
        ) (entryFullNames hostsDir)
      );
    };
}
