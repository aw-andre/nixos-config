{ config, lib, pkgs, ... }:

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
    SupplementaryGroups = [ "input" "uinput" ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-id/usb-Apple_Inc._Apple_Internal_Keyboard___Trackpad_FM7945403UHHYYKA9+WTN-if01-event-kbd"
          "/dev/input/by-id/usb-Keychron_K1_Machenike_K7-event-kbd"
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
