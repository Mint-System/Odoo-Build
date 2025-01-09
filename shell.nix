{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    docker
    python3
    wkhtmltopdf
    uv
  ];
  shellHook = ''
    alias task='./task'
    zsh
  '';
}
