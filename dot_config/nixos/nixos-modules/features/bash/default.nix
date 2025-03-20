{ lib, ... }:
{
  options = {
    enable = lib.mkOption {
      default = true;
    };
  };

  programs.bash.promptInit = "";
  environment.etc.inputrc.enable = false;
}
