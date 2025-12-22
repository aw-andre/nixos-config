{ pkgs, ... }: {
  networking.hostName = "mbp";
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
