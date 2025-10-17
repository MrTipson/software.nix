{
  description = "MrTipson's packages and overlays";

  outputs =
    { nixpkgs, ... }@inputs:
    let
      forAllSystems = with nixpkgs; (lib.genAttrs lib.systems.flakeExposed);
    in
    {
      packages = forAllSystems (system: import ./packages (nixpkgs.legacyPackages.${system}));
      overlays = import ./overlays;
    };
}
