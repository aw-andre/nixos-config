{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    initrd.kernelModules = [ "amdgpu" ];

    loader = {
      efi = {
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        efiInstallAsRemovable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];

        extraEntries = ''
          menuentry "MacOS" {
            exit
          }
        '';

	theme = pkgs.stdenv.mkDerivation {
	  pname = "distro-grub-themes";
	  version = "3.1";
	  src = pkgs.fetchFromGitHub {
	    owner = "AdisonCavani";
	    repo = "distro-grub-themes";
	    rev = "v3.1";
	    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
	  };
	  installPhase = "cp -r customize/nixos $out";
	};
      };
    };
  };

  networking = {
    hostName = "nixos-mbp";
    networkmanager.enable = true; 
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        mesa
	libva
	intel-media-driver
	intel-vaapi-driver
      ];
    };
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

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services = {
    blueman.enable = true;

    openssh = {
      enable = true;
      settings = {
        # Opinionated: forbid root login through SSH.
        # PermitRootLogin = "no";
        # Opinionated: use keys only.
        # Remove if you want to SSH using passwords
        # PasswordAuthentication = false;
      };
    };

#    displayManager.sddm = {
#      enable = true;
#      wayland.enable = true;
#    };
#
#    xserver = {
#      enable = true;
#      desktopManager.plasma5.enable = true;
#      xkb.layout = "us";
#    };
#
#    libinput = {
#      enable = true;
#      touchpad = {
#        naturalScrolling = true;
#        disableWhileTyping = true;
#      };
#      mouse.naturalScrolling = true;
#    };

    printing.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  users.users = {
    andreaw = {
      initialPassword = "setyourpassword";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [];
      extraGroups = [ "wheel" "video" "audio" "networkmanager" "lp" "scanner" ];
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.05";
}
