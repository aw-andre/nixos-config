{ ... }: {
  networking.hostName = "mbp";
  hardware.apple.t2.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
