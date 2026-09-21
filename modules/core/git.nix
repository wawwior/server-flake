{
  flake.nixosModules.core = { pkgs, ... }: {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
    environment.systemPackages = [ pkgs.git-lfs-transfer ];
  };
}
