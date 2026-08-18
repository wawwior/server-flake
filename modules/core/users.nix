{ ... }: {
  flake.nixosModules.core = {
    users = {
      users = {
        root = {
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7waydMiBAzBnktyhdNijO7BOHOC9P28Q77YeuIblHJ"
          ];
        };
      };
    };
  };
}
