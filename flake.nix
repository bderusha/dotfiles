# {
#   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#   inputs.flake-utils.url = "github:numtide/flake-utils";

#   outputs = { self, nixpkgs, flake-utils }:
#     flake-utils.lib.eachDefaultSystem  (system:
#       let
#         pkgs = import nixpkgs {
#           inherit system;
#           overlays = [self.overlay];
#         };
#       in rec {
#           devShell = {
#             packages = [
#               pkgs.pfetch
#             ];
#           };
#       }
#     );
# }

# {
#   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#   inputs.flake-utils.url = "github:numtide/flake-utils";

#   outputs = { self, nixpkgs, flake-utils }:
#     flake-utils.lib.eachDefaultSystem (system:
#       let pkgs = nixpkgs.legacyPackages.${system};
#       in {
#         defaultPackage.${system} = 
#           stdenv.mkDerivation {
#             name = "hello";
#             src = self;
#             buildInputs = [ pkgs.pfetch ];
#           };
#       }
#   );
# }

  # outputs = { self, nixpkgs, flake-utils }:
  #   flake-utils.lib.eachDefaultSystem (system:
  #     let pkgs = nixpkgs.legacyPackages.${system};
  #     in rec {
  #       packages = flake-utils.lib.flattenTree {
  #         gitAndTools = pkgs.gitAndTools;
  #         pfetch = pkgs.pfetch;
  #         neofetch = pkgs.neofetch;
  #         starship = pkgs.starship;
  #         git = pkgs.git;
  #       };
  #       defaultPackage = packages.neofetch;
  #       # apps.hello = flake-utils.lib.mkApp { drv = packages.hello; };
  #       # defaultApp = apps.hello;
  #     });

# {
#   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#   inputs.flake-utils.url = "github:numtide/flake-utils";

#   outputs = { self, nixpkgs, flake-utils }:
#     flake-utils.lib.eachDefaultSystem (system:
#       let
#         pkgs = import nixpkgs { inherit system; };
#       in
#       {
#         devShells.${system}.default = pkgs.mkShell {
#           packages = [
#             pkgs.pfetch
#             pkgs.neofetch
#             pkgs.starship
#             pkgs.git
#           ];
#           MY_ENV = 1; # Set as environment variable
#         };
#       }
#     );
# }


{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [
          pkgs.pfetch
          pkgs.git
          pkgs.python3
        ];
      };
    };
}