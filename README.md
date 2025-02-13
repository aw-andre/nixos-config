# Notes

This flake was set up employing workarounds to install Apple firmware and bypass the T2 Security Chip on Intel Macs.
This setup was tested on a 2019 Macbook Pro 16" (MacbookPro16,1) dual-booting MacOS and NixOS and has not been tested on M-series Macs.

Before using this flake, ensure that NixOS has been installed following the instructions on t2linux.org.

It is currently unclear whether or not storing firmware binaries in this Git repository is advisable; Nix requires that any paths used by a flake be staged in a Git repository.
