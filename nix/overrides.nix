{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  simplerssh = (
    with rec {
      simplersshSource = pkgs.lib.cleanSource ../.;
      simplersshBasic  = self.callCabal2nix "simplerssh" simplersshSource { };
    };
    overrideCabal simplersshBasic (old: {
    })
  );
}
