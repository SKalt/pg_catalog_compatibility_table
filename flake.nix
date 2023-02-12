{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # poetry2nix = {
    #   url = "github:nix-community/poetry2nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = { self, flake-utils, nixpkgs, poetry2nix }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = (import nixpkgs) {
            inherit system;
          };
          # myPoetryEnv = pkgs.poetry2nix.mkPoetryEnv
          #   {
          #     # python = pkgs.python311;
          #     projectDir = ./.;
          #   };
        in
        rec {
          devShell =
            pkgs.mkShell
              {
                nativeBuildInputs = with pkgs; [
                  go # 1.19.x
                  python310 # 3.10
                  poetry
                  nodejs # 18.x
                ];
                buildInputs = with pkgs; [
                  nixpkgs-fmt
                  nil
                  gopls
                  gotools
                  nodePackages.pnpm
                  helix
                  bashInteractive
                  # myPoetryEnv
                  # (pkgs.poetry2nix.mkPoetryEnv {
                  #   python = pkgs.python310;
                  #   projectDir = ./.;
                  # })
                ];
              };
        }
      );
}
