{ callPackage, ... }:
{
  packages = {
    drm-lease-manager = callPackage ./drm-lease-manager.nix { };
    libtoml = callPackage ./libtoml.nix { };
  };
}
