{
  description = "My Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        inherit username;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./nix-config/home.nix
          ./nix-config/bash.nix
          ./nix-config/git.nix
          ./nix-config/starship.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

      "${username}" = self.homeConfigurations."${username}".activationPackage;
      defaultPackage.x86_64-linux = self."${username}";
    };
}