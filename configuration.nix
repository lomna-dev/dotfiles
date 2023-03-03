# Currently using approx 8.9G/9242576
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
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "anmol"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # KDE Plasme
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.startx.enable = true;

  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11. Leave commented if you don't want to bother with this.
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  #  $$\   $$\                                     $$$$$$$\                     $$\                                              
  #  $$ |  $$ |                                    $$  __$$\                    $$ |                                             
  #  $$ |  $$ | $$$$$$$\  $$$$$$\   $$$$$$\        $$ |  $$ |$$$$$$\   $$$$$$$\ $$ |  $$\ $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\ 
  #  $$ |  $$ |$$  _____|$$  __$$\ $$  __$$\       $$$$$$$  |\____$$\ $$  _____|$$ | $$  |\____$$\ $$  __$$\ $$  __$$\ $$  _____|
  #  $$ |  $$ |\$$$$$$\  $$$$$$$$ |$$ |  \__|      $$  ____/ $$$$$$$ |$$ /      $$$$$$  / $$$$$$$ |$$ /  $$ |$$$$$$$$ |\$$$$$$\  
  #  $$ |  $$ | \____$$\ $$   ____|$$ |            $$ |     $$  __$$ |$$ |      $$  _$$< $$  __$$ |$$ |  $$ |$$   ____| \____$$\ 
  #  \$$$$$$  |$$$$$$$  |\$$$$$$$\ $$ |            $$ |     \$$$$$$$ |\$$$$$$$\ $$ | \$$\\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ $$$$$$$  |
  #   \______/ \_______/  \_______|\__|            \__|      \_______| \_______|\__|  \__|\_______| \____$$ | \_______|\_______/ 
  #                                                                                                $$\   $$ |                    
  #                                                                                                \$$$$$$  |                    
  #                                                                                                 \______/

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anmol = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox neofetch neovim htop python3 git pipenv
      
      # Emacs and it's optional dependencies
      emacs poppler_utils ghostscript
      
      # Web dev stuff
      nodejs bun docker docker-compose
      
      # Gamedev, graphics and other creative software
      godot inkscape libresprite love gimp
    ];
  };

  #   $$$$$$\    $$\                $$$$$$\   $$$$$$\        $$$$$$\        $$$$$$\        $$\       $$\                 $$\ 
  #  $$  __$$\   $$ |              $$  __$$\ $$  __$$\       \_$$  _|      $$  __$$\       $$ |      $$ |                $$ |
  #  $$ /  \__|$$$$$$\   $$\   $$\ $$ /  \__|$$ /  \__|        $$ |        $$ /  $$ | $$$$$$$ | $$$$$$$ | $$$$$$\   $$$$$$$ |
  #  \$$$$$$\  \_$$  _|  $$ |  $$ |$$$$\     $$$$\             $$ |        $$$$$$$$ |$$  __$$ |$$  __$$ |$$  __$$\ $$  __$$ |
  #   \____$$\   $$ |    $$ |  $$ |$$  _|    $$  _|            $$ |        $$  __$$ |$$ /  $$ |$$ /  $$ |$$$$$$$$ |$$ /  $$ |
  #  $$\   $$ |  $$ |$$\ $$ |  $$ |$$ |      $$ |              $$ |        $$ |  $$ |$$ |  $$ |$$ |  $$ |$$   ____|$$ |  $$ |
  #  \$$$$$$  |  \$$$$  |\$$$$$$  |$$ |      $$ |            $$$$$$\       $$ |  $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ \$$$$$$$ |
  #   \______/    \____/  \______/ \__|      \__|            \______|      \__|  \__| \_______| \_______| \_______| \_______|

  # Add ~/.local/bin/ to $PATH
  environment.localBinInPath = true;
  
  # Enable docker
  virtualisation.docker.enable = true;
  
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];

  #   $$$$$$\                        $$\                                   $$$$$$$\                     $$\                                              
  #  $$  __$$\                       $$ |                                  $$  __$$\                    $$ |                                             
  #  $$ /  \__|$$\   $$\  $$$$$$$\ $$$$$$\    $$$$$$\  $$$$$$\$$$$\        $$ |  $$ |$$$$$$\   $$$$$$$\ $$ |  $$\ $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\ 
  #  \$$$$$$\  $$ |  $$ |$$  _____|\_$$  _|  $$  __$$\ $$  _$$  _$$\       $$$$$$$  |\____$$\ $$  _____|$$ | $$  |\____$$\ $$  __$$\ $$  __$$\ $$  _____|
  #   \____$$\ $$ |  $$ |\$$$$$$\    $$ |    $$$$$$$$ |$$ / $$ / $$ |      $$  ____/ $$$$$$$ |$$ /      $$$$$$  / $$$$$$$ |$$ /  $$ |$$$$$$$$ |\$$$$$$\  
  #  $$\   $$ |$$ |  $$ | \____$$\   $$ |$$\ $$   ____|$$ | $$ | $$ |      $$ |     $$  __$$ |$$ |      $$  _$$< $$  __$$ |$$ |  $$ |$$   ____| \____$$\ 
  #  \$$$$$$  |\$$$$$$$ |$$$$$$$  |  \$$$$  |\$$$$$$$\ $$ | $$ | $$ |      $$ |     \$$$$$$$ |\$$$$$$$\ $$ | \$$\\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ $$$$$$$  |
  #   \______/  \____$$ |\_______/    \____/  \_______|\__| \__| \__|      \__|      \_______| \_______|\__|  \__|\_______| \____$$ | \_______|\_______/ 
  #            $$\   $$ |                                                                                                  $$\   $$ |                    
  #            \$$$$$$  |                                                                                                  \$$$$$$  |                    
  #             \______/                                                                                                    \______/

  # List packages installed in system profile. To search, run:
  # $ nix search wget


  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

    # System Packages
    wget gnumake gcc file dmenu unzip

    ## Packages for hyprland (Note: Not using this because hyprland is in beta and nixpkgs keeps a very old version currently)
    # hyprland waybar swaybg wofi

    # Packages for sway
    sway waybar swaybg wofi
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

