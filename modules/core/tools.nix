{
  flake.nixosModules.core = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      git-lfs
    ];
  };
}
