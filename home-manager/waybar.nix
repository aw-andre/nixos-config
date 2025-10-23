{
  programs.waybar = {
    enable = true;
    style = ''
      * {
      	 min-height: 15.0px;
      	 font-family: "Noto Sans";
      	 font-size: 18.0px;
      	 border: none;
      	 border-radius: 4.5px;
      }

      window#waybar {
      	background-color:transparent;
      	border-top: 12.0px transparent;
      	border-radius: 12.0px;
      	color: #ffffff;
      	margin: 24.0px 24.0px;
      	transition-property: background-color;
      	transition-duration: 5s;
      }

      window#waybar.hidden {
      	opacity: 0.2;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      }
      #window {
      	background: transparent;
      	color: transparent;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }
      #tags {
      	background: #161320;
      	font-size: 6.0px;
      	margin-top: 6.0px;
      	margin-bottom: 0.0px;
      	margin-left: 18.0px;
      	transition: none;
      }
      #tags button {
      	background: transparent;
      	border-radius: 3.0px;
      	color: #b5e8e0;
      	font-size: 24.0px;
      	transition: none;
      }
      #tags button.occupied {
      	background: transparent;
      	color: #f28fad;
      	font-size: 6.0px;
      	transition: none;
      }
      #tags button.focused {
      	border-bottom: 3.0px solid #abe9b3;
      	border-top: 3.0px solid #abe9b3;
      	color: #abe9b3;
      }
      #tags button:hover {
      	border-color: #e8a2af;
      	color: #fae3b0;
      	transition: none;
      }
      #tags button.focused:hover {
      	color: #e8a2af;
      }
      #workspaces button {
      	background-color: #1e2021;
      	color: #b5e8e0;
      	font-family: feather;
      	font-size: 15.0px;
      	margin: 6.0px 3.0px 0 3.0px;
      	min-width: 48.0px;
      	padding: 3.0px 0 0 0;
      }
      #workspaces button.active{
      	background: linear-gradient(220deg, rgba(248,189,150,1) 0%, rgba(181,232,224,1) 49%, rgba(0,212,255,1) 100%);
      	color: #1e2021;
      	font-family: feather;
      	font-size: 15.0px;
      	margin: 6.0px 3.0px 0 3.0px;
      	min-width: 48.0px;
      	padding: 3.0px 0 0 0;
      }
      #workspaces button:hover {
      	color: #b4befe;
      	font-family: feather;
      	font-size: 15.0px;

      }
      #workspaces button.focused {
              background-color: #bbccdd;
              color: #1e2021;
      	font-family: feather;
      	font-size: 15.0px;
      }
      #workspaces button.urgent {
              background-color: #fae3b0;
      	font-family: feather;
      	font-size: 15.0px;
      }

      #window,
      #workspaces {
      	font-family: feather;
      	font-size: 15.0px;
              margin: 0 6.0px;
      }

      .modules-left > widget:first-child > #workspaces {
              margin-left: 0;
      }

      .modules-right > widget:first-child > #workspaces {
              margin-right: 0;
      }

      #network {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #bd93f9;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #pulseaudio {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #fae3b0;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #battery {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #b5e8e0;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 10.5px;
      	padding-right: 7.5px;
      	transition: none;
      }

      #battery.charging, #battery.plugged {
        	background-color: #1e2021;
      	color: #b5e8e0;
      }

      #battery.critical:not(.charging) {
          	background-color: #1e2021;
          	color: #b5e8e0;
      }

      #backlight {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #f8bd96;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #clock {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #abe9b3;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 10.5px;
      	padding-right: 7.5px;
      	transition: none;
      }

      #memory {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #ddb6f2;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #temperature {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #f8bd96;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #cpu {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #96cdfb;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
      	padding-right: 15.0px;
      	transition: none;
      }

      #custom-launcher {
          	background: #1e2021;
      	border-radius: 4.5px;
          	color: #fae3b0;
      	font-size: 22.5px;
      	margin-left: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 16.5px;
      	padding-right: 4.5px;
      	transition: none;
      }

      #custom-power {
      	background: #1e2021;
      	border-radius: 4.5px;
      	color: #f28fad;
      	font-size: 15.0px;
      	margin-bottom: 0.0px;
      	margin-left: 6.0px;
      	margin-right: 6.0px;
      	margin-top: 6.0px;
      	padding-left: 15.0px;
          	padding-right: 15.0px;
      	padding-top: 3.0px;
      	transition: none;
      }
    '';
    settings = {

      mainBar = {
        #    // "layer"= "top"; // Waybar at top layer
        #    // "position"= "bottom"; // Waybar position (top|bottom|left|right)
        "height" = 60;
        #    // "width"= 1280; // Waybar width
        "spacing" = 6;
        #    // Choose the order of the modules
        "modules-left" = [ "hyprland/workspaces" ];
        "modules-center" = [ "hyprland/window" ];
        "modules-right" = [
          "mpd"
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "keyboard-state"
          "battery"
          "battery#bat2"
          "clock"
          "tray"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "warp-on-scroll" = false;
          "format" = "{name}: {icon}";
          "format-icons" = {
            # "1" = "";
            # "2" = "";
            # "3" = "";
            # "4" = "";
            # "5" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
        };
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{name} {icon}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "sway/mode" = { "format" = ''<span style="italic">{}</span>''; };
        "sway/scratchpad" = {
          "format" = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = [ "" "" ];
          "tooltip" = true;
          "tooltip-format" = "{app}: {title}";
        };
        "mpd" = {
          "format" =
            "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" =
            "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "unknown-tag" = "N/A";
          "interval" = 5;
          "consume-icons" = { "on" = " "; };
          "random-icons" = {
            "off" = ''<span color="#f53c3c"></span> '';
            "on" = " ";
          };
          "repeat-icons" = { "on" = " "; };
          "single-icons" = { "on" = "1 "; };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          #        // "icon-size"= 21;
          "spacing" = 10;
        };
        "clock" = {
          #        // "timezone"= "America/New_York";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          "format-alt" = "{:%Y-%m-%d}";
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = { "format" = "{}% "; };
        "temperature" = {
          #        // "thermal-zone"= 2;
          #        // "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input";
          "critical-threshold" = 80;
          #        // "format-critical"= "{temperatureC}°C {icon}";
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [ "" "" "" ];
        };
        "backlight" = {
          #        // "device"= "acpi_video1";
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            #            // "good"= 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-full" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          #        // "format-good"= ""; // An empty format will hide the module
          #        // "format-full"= "";
          "format-icons" = [ "" "" "" "" "" ];
        };
        "battery#bat2" = { "bat" = "BAT2"; };
        "power-profiles-daemon" = {
          "format" = "{icon}";
          "tooltip-format" = ''
            Power profile: {profile}
            Driver: {driver}'';
          "tooltip" = true;
          "format-icons" = {
            "default" = "";
            "performance" = "";
            "balanced" = "";
            "power-saver" = "";
          };
        };
        "network" = {
          #        // "interface"= "wlp2*"; // (Optional) To force the use of this interface
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          #        // "scroll-step"= 1; // %; can be a float
          "format" = "{volume}% {icon} {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };
        "custom/media" = {
          "format" = "{icon} {text}";
          "return-type" = "json";
          "max-length" = 40;
          "format-icons" = {
            "spotify" = "";
            "default" = "🎜";
          };
          "escape" = true;
          "exec" = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
          #        // "exec"= "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
        };
        "custom/power" = {
          "format" = "⏻ ";
          "tooltip" = false;
          "menu" = "on-click";
          "menu-file" = "$HOME/.config/waybar/power_menu.xml";
          "menu-actions" = {
            "shutdown" = "shutdown";
            "reboot" = "reboot";
            "suspend" = "systemctl suspend";
            "hibernate" = "systemctl hibernate";
          };
        };
      };
    };

  };
}
