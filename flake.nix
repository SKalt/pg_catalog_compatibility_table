{
  description = "development environment for pg_catalog_compatibility_table";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    gomod2nix = {
      url = "github:tweag/gomod2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, flake-utils, nixpkgs, gomod2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
          overlays = [ gomod2nix.overlays.default ];
        };
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            go # 1.21.x
          ];
          buildInputs = with pkgs; [
            # nix support
            nixpkgs-fmt
            nil

            # go development
            gopls
            gotools
            gomod2nix.packages.${system}.default
            goreleaser

            # JS/TS development
            nodejs_20
            nodejs_20.pkgs.pnpm

            # misc devtools
            shellcheck
            git
            # coreutils-full
            bashInteractive
          ];
        };
      }
    );
}
