{ lib
, buildNpmPackage
, fetchFromGitHub
}:

buildNpmPackage rec {
  pname = "mushroom";
  version = "3.5.5";

  src = fetchFromGitHub {
    owner = "piitaya";
    repo = "lovelace-mushroom";
    rev = "v${version}";
    hash = "sha256-ddxDgzD/dXA9H67Ttv1czDJMufk/IY8bWnVTnN8tdvc=";
  };

  npmDepsHash = "sha256-mxot6pz0ChUgPTeutNSULcktq19ccUo3nZTgzPZtlXM=";

  installPhase = ''
    runHook preInstall

    mkdir $out
    install -m0644 dist/mushroom.js $out

    runHook postInstall
  '';

  meta = with lib; {
    changelog = "https://github.com/piitaya/lovelace-mushroom/releases/tag/v${version}";
    description = "Mushroom Cards - Build a beautiful dashboard easily";
    homepage = "https://github.com/piitaya/lovelace-mushroom";
    license = licenses.asl20;
    maintainers = with maintainers; [ hexa ];
  };
}
