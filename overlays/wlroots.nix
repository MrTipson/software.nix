prev: final: {
  wlroots = prev.wlroots.override (old: {
    buildInputs = old.buildInputs ++ [ (prev.callPackage ../packages/drm-lease-manager.nix { }) ];
    patches = old.patches ++ [
      (prev.fetchpatch {
        url = "https://github.com/garlett/multiseat/blob/7b6e69cc5184d90a1d0fab043ccbf3d1da30cf6d/multiseat.patch";
        hash = "";
      })
    ];
  });
}
