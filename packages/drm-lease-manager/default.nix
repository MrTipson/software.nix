{
  lib,
  callPackage,
  stdenv,
  fetchFromGitHub,
  systemd,
  pkg-config,
  meson,
  ninja,
  libdrm,
}:
stdenv.mkDerivation {
  pname = "drm-lease-manager";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "AGLExport";
    repo = "drm-lease-manager";
    rev = "e6c3bf4ff76ae5eeefdb149e4b4167195dfcfb61";
    hash = "sha256-Fpa0TD+S3fqhdairW61ksOgOaUWjkxJ3HQwfMHHFDCM=";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
  ];

  buildInputs = [
    libdrm
    systemd
    (callPackage ../libtoml { })
  ];

  env.MESON_INSTALL_PREFIX = placeholder "out";
  mesonFlags = [
    (lib.mesonBool "enable-systemd" true)
    (lib.mesonOption "localstatedir" "/run")
    (lib.mesonOption "runtime_subdir" "drm-lease-manager")
  ];

  postPatch = "sed -i /meson.add_install_script/d meson.build";
}
