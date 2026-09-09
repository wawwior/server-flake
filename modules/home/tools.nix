{ ... }: {
  flake.homeModules.core = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      git
      vim
      tmux
      ripgrep
      (lib.hiPrio uutils-coreutils-noprefix)
    ];
  };
}
