{ pkgs, ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
    monitors = { 
      eDP-1 = [ "I" "II" "III" "IV" "V" ];
      HDMI-0 = [ "I" "II" "III" "IV" "V" ];
    };
    settings = {
      focus_follows_pointer = true;
      border-width = 2;
      window_gap = 12;
    };
    startupPrograms = [
     "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];
  };
}
