The included default.nix derivation will build an environment to execute the
iPython notebook and dependencies. If you already have nix, just run
"nix-shell" from the directory with default.nix.

If you don't have nix in your path, installation instructions are here*:

https://nixos.org/download.html

*because we can't have nice things, the latest MacOS (Catalina) restricted all access to the root directory, so nix can't install to /nix. You can create an APFS volume that mounts at /nix. See instructions here:

https://dev.to/louy2/installing-nix-on-macos-catalina-2acb
