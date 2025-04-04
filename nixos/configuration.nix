{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ./kanata.nix ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    #kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
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
      #"video=DP-2:d"
    ];

    consoleLogLevel = 3;
    initrd.kernelModules = [ "i915" "amdgpu" ];

    loader = {
      efi = { efiSysMountPoint = "/boot/efi"; };

      systemd-boot.enable = true;
      #      grub = {
      #        efiInstallAsRemovable = true;
      #        efiSupport = true;
      #        useOSProber = true;
      #        devices = [ "nodev" ];
      #
      #        extraEntries = ''
      #          menuentry "MacOS" {
      #            exit
      #          }
      #        '';
      #
      #	theme = pkgs.stdenv.mkDerivation {
      #	  pname = "distro-grub-themes";
      #	  version = "3.1";
      #	  src = pkgs.fetchFromGitHub {
      #	    owner = "AdisonCavani";
      #	    repo = "distro-grub-themes";
      #	    rev = "v3.1";
      #	    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
      #	  };
      #	  installPhase = "cp -r customize/nixos $out";
      #	};
      #      };
    };
  };

  networking = {
    hostName = "nixos-mbp";
    networkmanager.enable = true;
  };

  hardware = {
    graphics.enable = true;
    apple-t2.enableIGPU = true;
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
      pkgs.linux-firmware
    ];

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = { General.FastConnectable = true; };
    };
  };
  security.pam.services.hyprlock = { };

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

    postgresql = {
      enable = true;
      ensureUsers = [{ name = "andreaw"; }];
      ensureDatabases = [ "andreaw" ];
      initialScript = ./postgresrc.sql;
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
      audio.enable = true;
    };

    udev.extraRules = ''
      SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="low"
    '';
  };

  programs = {
    zsh.enable = true;
    thunar.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
    hyprlock.enable = true;
  };

  fonts.packages = with pkgs; [ font-awesome nerd-fonts.jetbrains-mono ];

  environment = {
    systemPackages = with pkgs; [ networkmanagerapplet wl-clipboard ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
    etc."inputrc".text = "set editing-mode vi";
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      andreaw = {
        initialPassword = "setyourpassword";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [ ];
        extraGroups = [
          "wheel"
          "video"
          "audio"
          "networkmanager"
          "lp"
          "scanner"
          "dialout"
          "uucp"
        ];
      };
    };
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.05";
}
