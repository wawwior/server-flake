{ self, inputs, ... }: {

  flake.nixosConfigurations.hermes = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with self.nixosModules; [
      hermes
      core
    ];
  };

  flake.nixosModules.hermes = { ... }: {
    networking.hostName = "hermes";
  };
}
