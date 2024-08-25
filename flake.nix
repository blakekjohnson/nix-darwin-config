{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, nixpkgs }@inputs: {
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      specialArgs = inputs;
      modules = [
        ./configuration.nix
      ];
    };

    darwinPackages = self.darwinConfigurations."air".pkgs;
  };
}
