# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/global/desktop
      ../common/optional/bluetooth.nix
      ../common/optional/pipewire.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "elitedesk"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
    time.timeZone = "America/New_York";
 
  # Intel Graphcs
    hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # your Open GL, Vulkan and VAAPI drivers
      vpl-gpu-rt          # for newer GPUs on NixOS >24.05 or unstable
#       onevpl-intel-gpu  # for newer GPUs on NixOS <= 24.05
#       intel-media-sdk   # for older GPUs
    ];
   };

   # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.nikos = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [

      ];
    };

   # Enable zsh 
   programs.zsh.enable = true;

   # Power Management
 #  powerManagement.powertop.enable = true;

  # Install Hyperland
    programs.hyprland.enable = true;
    programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;


  system.stateVersion = "24.11"; # Did you read the comment?
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # Allow Unfree Packages
  nixpkgs.config.allowUnfree = true; 

}

