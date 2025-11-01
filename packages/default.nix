{ callPackage, ... }:
{
  cage = callPackage ./cage { };
  drm-lease-manager = callPackage ./drm-lease-manager { };
  libtoml = callPackage ./libtoml { };
  inherit (callPackage ./sway { }) sway sway-unwrapped;
  inherit (callPackage ./wlroots { }) wlroots wlroots_0_19;
}
