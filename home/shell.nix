{ pkgs, ... }:

{
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.bash.shellAliases = {
  	nixcfg = "cd /etc/nix";
  };
}
