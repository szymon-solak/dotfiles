{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs: {
		homeConfigurations = {
			"szymonsolak" = inputs.home-manager.lib.homeManagerConfiguration {
				modules = [./home.nix];
				pkgs = import inputs.nixpkgs {
					system = "aarch64-darwin";
					config.allowUnfree = true;
				};
			};
		};
	};
}
