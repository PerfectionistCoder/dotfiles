let
  pkgs = import <nixpkgs> { };
  lib = pkgs.lib;
  stdenvMinimal = pkgs.stdenvNoCC.override {
    cc = null;
    preHook = "";
    allowedRequisites = null;
    initialPath = lib.filter (pkg: lib.hasPrefix "coreutils" pkg.name) pkgs.stdenvNoCC.initialPath;
    extraNativeBuildInputs = [ ];
  };
  minimalMkShell = pkgs.mkShell.override {
    stdenv = stdenvMinimal;
  };
in
minimalMkShell {
  name = "chezmoi";
  nativeBuildInputs = with pkgs; [
    fish-lsp
    nil
    nixfmt-rfc-style
    nurl
    taplo
  ];
}
