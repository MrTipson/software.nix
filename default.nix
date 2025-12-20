{
  self ? (import ./. { }),
  sources ? (import ./npins),
  nixpkgs ? (import sources.nixpkgs { }),
  ...
}:
{
  inherit self sources;
  outPath = ./.;

  packages = import ./packages nixpkgs;
}
