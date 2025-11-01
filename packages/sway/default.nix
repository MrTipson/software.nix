{
  sway,
  sway-unwrapped,
  callPackage,
}:
let
  inherit (callPackage ../wlroots { }) wlroots;
  patched = (sway-unwrapped.override { inherit wlroots; }).overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [ ./add-meson-dep.patch ];
  });
in
{
  sway-unwrapped = patched;
  sway = sway.override { sway-unwrapped = patched; };
}
