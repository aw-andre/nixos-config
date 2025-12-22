{ ... }: {
  networking.hostName = "desktop";
  boot.loader.efi.efiSysMountPoint = "/boot";
}
