let
  domain = "andreaw-desktop.dynv6.net";
  token = "x8nT91S9px-TAhiupXgtsxsFrMTwbo";

in { pkgs, ... }: {
  networking.hostName = "loblaws";
  boot.loader.efi.efiSysMountPoint = "/boot";

  wsl = {
    enable = true;
    defaultUser = "andreaw";
    docker-desktop.enable = true;
    useWindowsDriver = true;
    wslConf.automount.options = "uid=1000,gid=100";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # users.users.andreaw.openssh.authorizedKeys.keys = [
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRjAP//SG64jLi0HZ2Pep2Zu0NtmYYZGHLDQ2w1sg+u andreaw@mbp"
  # ];
  networking.firewall = {
    allowedTCPPortRanges = [{
      from = 12000;
      to = 12999;
    }];
    allowedUDPPortRanges = [{
      from = 12000;
      to = 12999;
    }];
  };
  services.openssh.ports = [ 12000 ];

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
        "https://dynv6.com/api/update?hostname=${domain}&token=${token}&ipv4=auto" \
        || true
    '';
}
