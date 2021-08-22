{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    script = "polybar main &";
    extraConfig = (builtins.readFile ./config);
  };
}
