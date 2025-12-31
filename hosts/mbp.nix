let
  domain = "andreaw-laptop";
  token = "62c67674-bc4c-4e57-8fd8-acb9c2f57dea";

in { pkgs, ... }: {
  networking.hostName = "mbp";

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

  users.users.andreaw.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGkL74Zu5o9EJkDfLaiu59nEvYuyFWPuglvVceQ4Ny5y andreaw@desktop"
  ];
  networking.firewall.allowedTCPPorts = [ 11000 ];
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    ports = [ 11000 ];
  };

  boot = {
    kernelParams = [
      # gpu
      "amdgpu.dc=1"
      "amdgpu.dpm=1"
      "amdgpu.runpm=0"
      "amdgpu.bapm=0"
      "amdgpu.audio=0"
      "amdgpu.ppfeaturemask=0xffffffff"
      "amdgpu.modeset=1"
      "amdgpu_iommu=on"
      "intel_iommu=on"
      "iommu=pt"
      "pci=noaer"
      "pcie_ports=compat"
      "i915.force_probe=*"
      "i915.enable_psr=0"
      "i915.enable_fbc=0"
      "i915.modeset=1"
      "i915.enable_guc=3"
    ];

    initrd.kernelModules = [ "i915" "amdgpu" ];

    loader.efi.efiSysMountPoint = "/boot/efi";
  };

  hardware = {
    # gpu
    apple-t2.enableIGPU = true;

    # wifi/bluetooth
    firmware = [
      (pkgs.stdenvNoCC.mkDerivation {
        name = "brcm-firmware";
        src = ./firmware/brcm;
        buildCommand = ''
          dir="$out/lib/firmware"
          mkdir -p "$dir"
          cp -r ${./firmware}/* "$dir"
        '';
      })
    ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="low"
    SUBSYSTEM=="usb", ATTR{idVendor}=="1949", ATTR{idProduct}=="9981", MODE="0666", GROUP="plugdev"
  '';
}
