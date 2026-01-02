let
  domain = "andreaw-desktop.dynv6.net";
  token = "x8nT91S9px-TAhiupXgtsxsFrMTwbo";

in { pkgs, ... }: {
  networking.hostName = "desktop";
  boot.loader.efi.efiSysMountPoint = "/boot";

  users.users.andreaw.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRjAP//SG64jLi0HZ2Pep2Zu0NtmYYZGHLDQ2w1sg+u andreaw@mbp"
  ];
  networking.firewall = {
    allowedTCPPorts = [ 10000 ];
    allowedUDPPorts = [ 10000 ];
  };
  services.openssh.ports = [ 10000 ];

  environment.etc."NetworkManager/dispatcher.d/90-dynv6".source =
    pkgs.writeShellScript "dynv6-dispatcher" ''
      #!/usr/bin/env bash
      set -eu

      INTERFACE="$1"
      ACTION="$2"

      # Only update on useful events
      case "$ACTION" in
        up|dhcp4-change|dhcp6-change|connectivity-change)
          ;;
        *)
          exit 0
          ;;
      esac

      ${pkgs.curl}/bin/curl -fsS \
        "https://dynv6.com/api/update?hostname=${domain}&token=${token}" \
        || true
    '';
}
