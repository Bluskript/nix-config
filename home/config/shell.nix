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
    };
  };
}
