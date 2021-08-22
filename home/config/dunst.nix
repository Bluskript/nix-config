{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        title = "Dunst";
        class = "Dunst";
        monitor = 0;
        follow = "mouse";
        /*geometry = "350x6+24+60"*/
        geometry = "300x6-30+60";
        indicate_hidden = true;
        shrink = true;

        transparency = 5;
        separator_height = 2;
        padding = 16;
        horizontal_padding = 13;
        frame_width = 2;
        frame_color = "#ff9e9e";
        separator_color = "#404859";

        font = "Inconsolata Bold 10";

        line_height = 0;
        markup = "full";
        format = "<span size='x-large' font_desc='Inconsolata 11' weight='bold' foreground='#ffffff'>%s</span>\n\n%b";
        alignment = "center";

        idle_threshold = 120;
        show_age_threshold = 60;
        sort = false;
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = false;
        hide_duplicate_count = true;
        show_indicators = false;
        sticky_history = true;
        history_length = 50;
        always_run_script = true;
        corner_radius = 0;
        icon_position = "left";
        max_icon_size = 96;

        browser = "google-chrome-stable";

        mouse_left_click = "close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "close_all";
      };

      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+Escape";
        context = "ctrl+shift+period";
      };

      urgency_low = {
        # IMPORTANT: colors have to be defined in quotation marks.
        # Otherwise the "#" and following would be interpreted as a comment.
        background = "#1C1E2750";
        foreground = "#cacacc";
        timeout = 5;
        # Icon for notifications with low urgency, uncomment to enable
        #icon = /path/to/icon
      };

      urgency_normal = {
        background = "#1C1E27";
        foreground = "#cacacc";
        timeout = 5;
        # Icon for notifications with normal urgency, uncomment to enable
        #icon = /path/to/icon
      };

      urgency_critical = {
        background = "#1C1E2750";
        foreground = "#cacacc";
        timeout = 120;
      };
    };
  };
}
