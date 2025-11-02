{
  description = "Provides multiseat packages";

  outputs =
    { nixpkgs, ... }@inputs:
    let
      forAllSystems = with nixpkgs; (lib.genAttrs lib.systems.flakeExposed);
    in
    {
      packages = forAllSystems (system: import ./packages (nixpkgs.legacyPackages.${system}));
    };
}
