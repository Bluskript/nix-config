{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = [
      #      pkgs.vscode-extensions.bbenoist.Nix
    ];

    userSettings = {
      "editor.tabSize" = 2;
      "workbench.tree.expandMode" = "doubleClick";
      "workbench.list.openMode" = "doubleClick";
      "workbench.iconTheme" = "material-icon-theme";
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
      };
    };
  };
}
