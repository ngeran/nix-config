{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors";
    
    hyprland-plugins = {
	url = "github:hyprwm/hyprland-plugins";
	inputs.hyprland.follows = "hyprland";
    };

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # NixOs Configuration
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./hosts/default/configuration.nix
	 # Home Manager as nixos module
         #inputs.home-manager.nixosModules.default
      ];
    };
    
    # Home Configuration 
    homeConfigurations."nikos" = home-manager.lib.homeManagerConfiguration {
    	# Specify the host architecture
	pkgs = nixpkgs.legacyPackages.${system};

 	extraSpecialArgs = { inherit inputs; };
	# Specify your home configuration modules here
	modules = [
           ./hosts/default/home.nix
	];
    };
  };
}
