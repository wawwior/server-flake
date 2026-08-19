{ ... }: {
  flake.homeModules.core = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      git
      vim
      ripgrep
      (lib.hiPrio uutils-coreutils-noprefix)
    ];
  };
}
