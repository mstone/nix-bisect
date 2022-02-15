
{
  description = "Bisect Nix Builds";

  inputs.nixpkgs.url = "nixpkgs";

  inputs.utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, utils, }: let
    name = "nix-bisect";
  in utils.lib.simpleFlake {
    inherit self nixpkgs name;
    preOverlays = [ ];
    systems = utils.lib.defaultSystems;
    overlay = final: prev: {
      nix-bisect = with final; rec {
        nix-bisect = import self { pkgs = prev; };
        defaultPackage = nix-bisect;
      };
    };
  };
}
