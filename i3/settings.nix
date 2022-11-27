{ pkgs, lib, ... }:
let
  myConfig = import ./config.nix;
in
{
  package = pkgs.i3-gaps;
  enable = true;
  config = myConfig;
}
