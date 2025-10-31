{
  callPackage,
  fetchpatch,
  wlroots,
  wlroots_0_19,
}:
let
  drm-lease-manager = callPackage ../drm-lease-manager { };
  wlr-override = old: {
    buildInputs = old.buildInputs ++ [ drm-lease-manager ];
    patches = old.patches ++ [
      #./multiseat.patch
      (fetchpatch {
        url = "https://raw.githubusercontent.com/garlett/multiseat/7b6e69cc5184d90a1d0fab043ccbf3d1da30cf6d/multiseat.patch";
        hash = "sha256-whuEKY5xyxMMV6HvMWxZ6UcRFK+MELfV7GcrNPSUlgc=";
      })
      ./fix-crash.patch
    ];
  };
in
{
  wlroots = wlroots.overrideAttrs wlr-override;
  wlroots_0_19 = wlroots_0_19.overrideAttrs wlr-override;
}
