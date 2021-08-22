{ pkgs, config, ... }:

{
  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    shellAliases = {
      nixcfg = "cd /etc/nixos";
      ntest = "sudo nixos-rebuild test";
      up = "sudo nixos-rebuild switch --upgrade";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
