{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {

      # reloads sxhkd
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # starts alacritty, the terminal emulator
      "super + Return" = "alacritty";

      # file browser
      "super + apostrophe" = "dolphin";

      # quit / restart bspwm
      "super + alt + {q,r}" = "bspc {quit, wm -r}";

      # close and kill
      "super + {_,shift + }w" = "bspc node -{c,k}";

      # run menu
      "super + space" = "rofi -show run";

      # screenshotting
      "Print" = "$HOME/scripts/screenshot.sh";

      # draw-in terminals
      "super + shift + Return" = "$HOME/scripts/draw.sh";
    };
  };
}
