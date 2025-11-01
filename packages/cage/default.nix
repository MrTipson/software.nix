{ callPackage, cage }:
(cage.override {
  inherit (callPackage ../wlroots { }) wlroots_0_19;
}).overrideAttrs
  (old: {
    patches = (old.patches or [ ]) ++ [ ./add-meson-dep.patch ];
  })
