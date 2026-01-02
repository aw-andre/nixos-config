let
  domain = "andreaw-mbp.dynv6.net";
  token = "x8nT91S9px-TAhiupXgtsxsFrMTwbo";

in { pkgs, ... }: {
  networking.hostName = "mbp";

  nix.buildMachines = [{
    hostName = "desktop";
    system = "x86_64-linux";
    maxJobs = 16;
    supportedFeatures = [ "big-parallel" ];
  }];

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

  users.users.andreaw.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGkL74Zu5o9EJkDfLaiu59nEvYuyFWPuglvVceQ4Ny5y andreaw@desktop"
  ];
  networking.firewall = {
    allowedTCPPorts = [ 11000 ];
    allowedUDPPorts = [ 11000 ];
  };
  services.openssh.ports = [ 11000 ];

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
