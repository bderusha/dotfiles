{ config, pkgs, ... }:

{
  programs.gpg.enable = true;
  programs.home-manager.enable = true;
  programs.jq.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
    cowsay
    neofetch
  ];

  home.file.".config/neofetch/config.conf".source = ./neofetch.conf;

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";
    defaultCacheTtl = 86400;
    enableSshSupport = true;
    enableBashIntegration = true;
  };

}
