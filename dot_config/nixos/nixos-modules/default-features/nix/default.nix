{ inputs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    nixPath = [
      "nixpkgs=/etc/nix/inputs/nixpkgs"
      "nixpkgs-overlays=/etc/nix/inputs/nixpkgs-overlays"
    ];
    channel.enable = false;
  };
  environment.etc = {
    "nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
    "nix/inputs/nixpkgs-overlays".source = "${inputs.nixpkgs-overlays}";
  };
}
