{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Enable the uinput module
  boot.kernelModules = [ "uinput" ];

  # Enable uinput
  hardware.uinput.enable = true;

  # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:3:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:3:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:4:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:4:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:04:00.1-usb-0:5:1.1-event-kbd"
          "/dev/input/by-path/pci-0000:04:00.1-usbv2-0:5:1.1-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            a   s   d   f   j   k   l   ;
          )
          (defvar
            tap-time 150
            hold-time 150
          )
          (defalias
            a (tap-hold $tap-time $hold-time a lalt)
            s (tap-hold $tap-time $hold-time s lmet)
            d (tap-hold $tap-time $hold-time d lctl)
            f (tap-hold $tap-time $hold-time f lsft)
            j (tap-hold $tap-time $hold-time j rsft)
            k (tap-hold $tap-time $hold-time k rctl)
            l (tap-hold $tap-time $hold-time l rmet)
            ; (tap-hold $tap-time $hold-time ; ralt)
          )
          (deflayer base
            @a  @s  @d  @f  @j  @k  @l  @;
          )
        '';
      };
    };
  };
}
