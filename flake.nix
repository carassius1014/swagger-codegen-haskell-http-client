{
  description = "swagger-codegen templates for haskell-http-client";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-darwin" "x86_64-linux" ] (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = with pkgs;
          mkShell { buildInputs = [ nixfmt swagger-codegen ]; };
      });
}
