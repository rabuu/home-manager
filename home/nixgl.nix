{ pkgs, nixgl, ... }:
{
  nixGL.packages = import nixgl { inherit pkgs; };
}
