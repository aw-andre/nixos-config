{
  networking.hostName = "loblaws-wsl";
  boot.loader.efi.efiSysMountPoint = "/boot";

  wsl = {
    enable = true;
    defaultUser = "andreaw";
    docker-desktop.enable = true;
    useWindowsDriver = true;
    wslConf.automount.options = "uid=1000,gid=100";
  };

  security.pki.certificateFiles = [ ./loblaws-cert.crt ];

  # users.users.andreaw.openssh.authorizedKeys.keys = [
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBRjAP//SG64jLi0HZ2Pep2Zu0NtmYYZGHLDQ2w1sg+u andreaw@mbp"
  # ];
}
