let
  domain = "andreaw-desktop";
  token = "62c67674-bc4c-4e57-8fd8-acb9c2f57dea";

in { pkgs, ... }: {
  networking.hostName = "desktop";
  boot.loader.efi.efiSysMountPoint = "/boot";

  users.users.andreaw.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRjAP//SG64jLi0HZ2Pep2Zu0NtmYYZGHLDQ2w1sg+u andreaw@mbp"
  ];
  networking.firewall.allowedTCPPorts = [ 10000 ];
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    ports = [ 10000 ];
  };

  systemd = {
    timers.duckdns-update = {
      description = "DuckDNS updater timer";
      timerConfig = {
        OnBootSec = "1min";
        OnUnitActiveSec = "5min";
      };
    };
    services.duckdns-update = {
      description = "DuckDNS updater";
      serviceConfig = {
        ExecStart = ''
          ${pkgs.curl}/bin/curl -s "https://www.duckdns.org/update?domains=${domain}&token=${token}&ip="'';
        Type = "oneshot";
      };
    };
  };
}
