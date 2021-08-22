{ pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      # reloads sxhkd
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # starts alacritty, the terminal emulator
      "super + Return" = "alacritty";

      # focus or send to the given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} 'focused:^{1-9,10}'";

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
