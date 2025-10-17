{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "libtoml";
  version = "26b9c1e";

  src = fetchFromGitHub {
    owner = "cktan";
    repo = "tomlc99";
    rev = "26b9c1ea770dab2378e5041b695d24ccebe58a7a";
    hash = "sha256-VWdv80klW/Wuf1PhIIoW2hdclMJ8hKmyS/cH4Y4J1AE=";
  };

  installPhase = ''
    runHook preInstall

    make prefix=$out install
    install -D libtoml.pc.sample $out/lib/pkgconfig/libtoml.pc

    runHook postInstall
  '';
}
