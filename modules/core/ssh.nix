{ ... }: {
  flake.nixosModules.core = { pkgs, ... }: {
    services.openssh.enable = true;
  };
}
