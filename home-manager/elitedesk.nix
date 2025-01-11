{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nikos";
  home.homeDirectory = "/home/nikos";

	imports = [
             ./features/cli
             ./features/desktop/hyprland
             ./features/desktop/waybar
             ./features/desktop/rofi
          inputs.nix-colors.homeManagerModules.default
        ];

  # Color Scheme
   colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
