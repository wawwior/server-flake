{ ... }: {
  flake.homeModules.core = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      vim
      ripgrep
      (lib.hiPrio uutils-coreutils-noprefix)
    ];
  };
}
