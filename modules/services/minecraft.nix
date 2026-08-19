{ inputs, ... }: {
  flake.nixosModules.minecraft = { pkgs, ... }: {
    imports = [
      inputs.nix-minecraft.nixosModules.minecraft-servers
    ];

    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

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
              packHash = "sha256-7c6oWUuGJVVEPdTQS68d2zSUTR3VND8AJP15miSJso0=";
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
              motd = "cinnatastic! (hosted on NixOS :P)";
            };
          };
      };
    };
  };
}
