{ ... }: {
  flake.homeModules.core = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      vim
      tmux
      ripgrep
      (lib.hiPrio uutils-coreutils-noprefix)
    ];
  };
}
