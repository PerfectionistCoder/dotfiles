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
          pkgs = import nixpkgs {
            inherit system;
            overlays = import ./overlays;
            config.allowUnfreePredicate = pkg: (import ./unfree lib pkg);
          };
        in
        listToAttrs (
          map (name: {
            inherit name;
            value = pkgs.buildEnv {
              inherit name;
              paths = import "${packagesDir}/${name}.nix" pkgs;
            };
          }) (fileNames packagesDir)
          ++ map (name: {
            inherit name;
            value = pkgs.buildEnv {
              inherit name;
              paths = import "${hostsDir}/${name}/packages.nix" pkgs;
            };
          }) (entryFullNames hostsDir)
        )
      );
      nixosConfigurations = listToAttrs (
        map (name: {
          inherit name;
          value = nixpkgs.lib.nixosSystem {
            inherit lib;
            specialArgs = {
              inputs = inputs // {
                nixpkgs-overlays = ./overlays/default.nix;
              };
            };
            modules = [
              {
                networking.hostName = "nixos-${name}";
              }
              nixosModules
              "${hostsDir}/${name}/config.nix"
            ];
          };
        }) (entryFullNames hostsDir)
      );
    };
}
