# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;
  	boot.loader.grub.useOSProber = true;
	
  # Thinkfan control - still not working
    services.thinkfan.enable = true;
  # services.thinkfan.sensor = "/sys/class/hwmon/hwmon0/temp1_input";

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "us";
      defaultLocale = "en_IL.UTF-8";
    };

  # Set your time zone.
    time.timeZone = "Asia/Jerusalem";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
  # free
	ansible
	atom
	bind
	calibre
	chromium
	cmake
	cool-retro-term
	deja-dup
	deluge
	docker
	dmidecode
	exfat
	filezilla
	flatpak
	franz
	gimp
	git
	gitkraken
	gparted
	htop
	icecat
	kdenlive
	kubernetes
	lastpass-cli
	libreoffice
	lshw
	nixui
	nmap
	openshift
	parted
	pciutils
	powershell
	qtkeychain
	remmina
	rhythmbox
	samba
	shutter
	solaar
	thunderbird
	thinkfan #lenovo
	#tomahawk - broken
	transmission-remote-gtk
	vim
	virtualbox
	vlc
	wesnoth
	wget
	wireshark
	zsh
  # nonfree
	adobe-reader
	anydesk	
	google-chrome
	google-chrome-beta
	# rambox - currently not working
	spotify
	steam
	teamviewer
  # manual only?
	# elementary-music
	# gnome-boxes
	# qemu
	# pycharm-community-2019.1
	# sushi
	# zenmap (not found?)
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Automatically upgrade system and channel.
    system.autoUpgrade.enable = true;
    system.autoUpgrade.channel = https://nixos.org/channels/nixos-19.03;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
    services.printing.enable = true;

  # Enable sound.
    sound.enable = true;
    hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.layout = "us";
    services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
    services.xserver.libinput.enable = true;

  # Enable specific software.
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;

  # Enable the Desktop Environment.

  # KDE
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  # Gnome
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome3.enable = true;
  # Pantheon
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.pantheon.enable = true;

  # Virtualisation Configutations.
	# enable docker
	  virtualisation.docker.enable = true;
	# enable virtualbox, Oracle Extension Pack
	  virtualisation.virtualbox.host.enable = true;
	  virtualisation.virtualbox.host.enableExtensionPack = true;
	# Allow my regular use to control Docker.
	  users.extraUsers.USER.extraGroups = [ "docker" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.daniel = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
