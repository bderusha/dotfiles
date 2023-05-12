{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  
  home.username = "bill";
  home.homeDirectory = "/home/bill";
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    cowsay
    neofetch
    jq
  ];

  home.file.".config/neofetch/config.conf".source = "./neofetch.conf";

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";
    defaultCacheTtl = 86400;
    enableSshSupport = true;
  };

}
