{ inputs, ... }: {
  flake.nixosModules.minecraft = { pkgs, ... }: {
    imports = [
      inputs.nix-minecraft.nixosModules.minecraft-servers
    ];

    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

    # simple voice chat port
    networking.firewall.allowedUDPPorts = [ 24454 ];

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers = {
        cinnatastic =
          let
            pack = pkgs.fetchPackwizModpack {
              pname = "cinnatastic-pack";
              version = "latest";
              url = "https://raw.githubusercontent.com/wawwior/cinnatastic/main/pack.toml";
              packHash = "sha256-86AwYiQUysdWErL4GPBFVLYvSr71Y4AhtSjfke8Vv/Y=";
            };
            inherit (inputs.nix-minecraft.lib) collectFilesAt;
          in
          {
            enable = true;
            autoStart = true;
            package = pkgs.neoforgeServers.neoforge-1_21_1;
            symlinks = collectFilesAt pack "mods";
            files = collectFilesAt pack "config";
            serverProperties = {
              server-port = 25565;
              spawn-protection = 0;
              motd = "cinnatastic! (hosted on NixOS :P)";
            };
            operators = {
              "Wawwior" = "7cb790ac-89f3-4557-a45b-864560a6864a";
            };
          };
      };
    };
  };
}
