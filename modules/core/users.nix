{ self, inputs, ... }: {
  flake.nixosModules.core = {

    imports = [
      inputs.home-manager.nixosModules.default
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };

    users.users = {
      root = {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7waydMiBAzBnktyhdNijO7BOHOC9P28Q77YeuIblHJ"
        ];
      };
    };

    home-manager.users = with self.homeModules; {
      root.imports = [
        core
        helix
      ];
    };
  };
}
