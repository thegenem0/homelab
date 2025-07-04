{ pkgs, ... }: {
  languages.python = {
    enable = true;
    package = pkgs.python312;
    venv = {
      enable = true;
      requirements = ''
        ansible
        netaddr
      '';
    };
  };

  env = {
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
      pkgs.pythonManylinuxPackages.manylinux2014Package
      pkgs.stdenv.cc.cc
      pkgs.zlib
    ]}";
  };

  packages = with pkgs; [ kubectl kubernetes-helm usbutils screen lrzsz ];
}
