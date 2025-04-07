{ lib, ... }:
{
  programs.bash = {
    promptInit = "";
    completion.enable = false;
    interactiveShellInit = lib.mkForce ''
      :
    '';
  };
  environment.etc.inputrc.enable = false;
}
