{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      mod = "dock";
      exclusive = true;
      passthrough = false;
      height = 30;
      modules-left = [ "clock" "tray" ];
      modules-center = [ ];
      modules-right =
        [ "cpu" "temperature" "custom/nvitop" "pulseaudio" "network" ];
      clock = { format = "  {:%H:%M %p   %a %d}"; };
      cpu = {
        interval = 10;
        format = "  {usage}%";
      };
      temperature = { format = "  {temperatureC}°C"; };
      tray = {
        icon-size = 20;
        spacing = 9;
      };
      network = {
        tooltip = true;
        format-wifi = "  {bandwidthDownBytes}   {bandwidthUpBytes}";
        format-ethernet = "  {bandwidthDownBytes}   {bandwidthUpBytes}";
        tooltip-format = ''
          Network: <big><b>{essid}</b></big>
          Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
          Frequency: <b>{frequency}MHz</b>
          Interface: <b>{ifname}</b>
          IP: <b>{ipaddr}/{cidr}</b>
          Gateway: <b>{gwaddr}</b>
          Netmask: <b>{netmask}</b>'';
        format-linked = " {ifname} (No IP)";
        format-disconnected = "  ";
        tooltip-format-disconnected = "Disconnected";
        interval = 2;
      };
      pulseaudio = {
        format = " ";
        on-click = "pavucontrol";
      };
      "custom/nvitop" = {
        format = " ";
        on-click = "kitty nvitop --monitor";
      };
    }];
    style = ''
      @define-color background-darker rgba(30, 31, 41, 0.8);
      @define-color background #282a36;
      @define-color selection #44475a;
      @define-color foreground #f8f8f2;
      @define-color comment #6272a4;
      @define-color cyan #8be9fd;
      @define-color green #50fa7b;
      @define-color orange #ffb86c;
      @define-color pink #ff79c6;
      @define-color purple #bd93f9;
      @define-color red #ff5555;
      @define-color yellow #f1fa8c;

      * {
          border: none;
          border-radius: 0px;
          font-family: IosevkaTerm NF Heavy;
          font-weight: bold;
          font-size: 18px;
          min-height: 0px;
        }
                
        window#waybar {
            color: @selection;
            background: @background-darker;
            border-bottom: 2px solid @background;
        }

        #cpu {
           background: @purple;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #temperature {
           background: @purple;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #tray {
           background: @purple;
           border-radius: 10px;
           border: 3px solid #000000;
           margin: 4px 2px;
           padding: 4px 4px;
        }

        #network {
            background: @purple;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }

        #clock {
            background: @purple;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }

        #pulseaudio {
            background: @purple;
            border-radius: 10px;
            border: 3px solid #000000;
            margin: 4px 2px;
            padding: 4px 4px;
        }        

        #custom-nvitop {
          background: @purple;
          border-radius: 10px;
          border: 3px solid #000000;
          margin: 4px 2px;
          padding: 4px 4px;
        }
    '';
  };
}
