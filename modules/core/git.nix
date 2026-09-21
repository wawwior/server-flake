{
  flake.nixosModules.core = { ... }: {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
