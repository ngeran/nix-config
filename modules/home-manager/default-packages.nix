{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps

    # CLI utils
    microfetch
    unzip
    wget
    wl-clipboard
    zip
    starship
    oh-my-posh
    alacritty
    tree
    ntfs3g
    brightnessctl
    picom

    # Coding stuff
    nodejs
    cargo
    gnumake

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    #Sound
    pulseaudio

    # Other
    bat
    tailwindcss
  ];
}

