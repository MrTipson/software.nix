{ callPackage, cage }:
let
  drm-lease-manager = callPackage ../../packages/drm-lease-manager { };
  inherit (callPackage ../wlroots { }) wlroots_0_19;
in
(cage.override { inherit wlroots_0_19; }).overrideAttrs (old: {
  buildInputs = old.buildInputs ++ [ drm-lease-manager ];
  patches = (old.patches or [ ]) ++ [ ./add-meson-dep.patch ];
})
