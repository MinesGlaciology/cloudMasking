{
  current ? import (builtins.fetchTarball {
             url = "https://github.com/NixOS/nixpkgs/archive/20.03.tar.gz";
             # Hash obtained using `nix-prefetch-url --unpack <url>`
             sha256 = "0182ys095dfx02vl2a20j1hz92dx3mfgz2a6fhn31bqlp1wa8hlq";
             }) {}
}:

with current;

stdenv.mkDerivation rec {
  name = "env" ;
  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup; ln-s $env $out
  '';

  buildInputs = [ python37 git geos openjpeg zlib netcdf 
    (python37.buildEnv.override {
      ignoreCollisions = true;
      extraLibs = with python37Packages; [
	h5py
        scikitlearn
        netcdf4
        rasterio
        numpy
        scipy
        matplotlib
        wheel
        joblib
        pyproj
        pip
        jupyter
        cython
        setuptools
        gdal
      ];
     })
    ];


shellHook = ''
    alias pip="PIP_PREFIX='$(pwd)/_build/pip_packages' \pip"
    export PYTHONPATH="$(pwd)/_build/pip_packages/lib/python3.7/site-packages:$PYTHONPATH"
    export GEOS_DIR="${pkgs.geos}"
    unset SOURCE_DATE_EPOCH
'';}
