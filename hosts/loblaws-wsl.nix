{
  networking.hostName = "loblaws-wsl";
  boot.loader.efi.efiSysMountPoint = "/boot";

  wsl = {
    enable = true;
    defaultUser = "andreaw";
  };

  systemd = {
    services.fix-wsl-runtime = {
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        chown 1000:1000 /run/user/1000
        chmod 700 /run/user/1000
        mkdir -p /run/user/1000/wslg
        mount --bind /mnt/wslg/runtime-dir /run/user/1000/wslg
        ln -sf /mnt/wslg/runtime-dir/wayland-0 /run/user/1000/wayland-0
      '';
      wantedBy = [ "multi-user.target" ];
    };
    paths.fix-wsl-runtime = {
      wantedBy = [ "multi-user.target" ];
      pathConfig.PathExists = "/run/user/1000";
    };
  };

  security.pki.certificateFiles = [ ./loblaws-cert.crt ];
}
