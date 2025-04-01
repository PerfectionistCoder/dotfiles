{ lib, pkgs, ... }:
{
  programs.bash = {
    promptInit = "";
    completion.enable = false;
  };
  users.defaultUserShell = pkgs.bashNonInteractive;
  environment.etc.inputrc = {
    enable = false;
    source = null;
  };
}
