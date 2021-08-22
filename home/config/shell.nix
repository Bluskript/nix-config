{ pkgs, ... }:

{
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nixcfg = "cd /etc/nixos";
      ntest = "sudo nixos-rebuild test";
      up = "sudo nixos-rebuild switch --upgrade";
    };
  };
}
