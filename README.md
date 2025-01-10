# Notes

This flake was set up employing workarounds to install Apple firmware and bypass the T2 Security Chip on Intel Macs.
This setup was tested on a 2019 Macbook Pro 16" (MacbookPro16,1) dual-booting MacOS and NixOS and has not been tested on M-series Macs.

Before using this flake, ensure that NixOS has been installed following the instructions on t2linux.org and that the associated firmware is in this directory and versioned by Git.
Do not make Git ignore the binaries in 'firmware/'; this will cause NixOS to assume that the directory does not exist.
In the future, it may be necessary to transition to Git LFS to contain the associated binaries in the same Git repo.
