{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bill";
  home.homeDirectory = "/home/bill";
  home.stateVersion = "22.11";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # programs.bash = {
  #   enable = true;
  #   enableCompletion = true;
  # };

  programs.git = {
    enable = true;

    userName = "bderusha";
    userEmail = "bderush+123456@github.com";
    aliases = {
      sw = "switch";
      tmp = "checkout -b tmp0123";
      tmp1 = "checkout -b tmp123";
      tmp2 = "checkout -b tmp321";
      tmp3 = "checkout -b tmp246";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$username$hostname$directory$git_branch$git_commit$git_state$git_status$cmd_duration$line_break$jobs$character";
      username = {
        style = "bold blue";
        disabled = true;
      };
      hostname = {
        style = "bold blue";
        disabled = true;
      };
      directory = {
        style = "bold blue";
        disabled = false;
      };
      git_branch = {
        style = "bold blue";
        disabled = false;
      };
      git_commit = {
        style = "bold blue";
        disabled = false;
      };
      git_state = {
        style = "bold blue";
        disabled = false;
      };
      git_status = {
        style = "bold blue";
        disabled = false;
      };
      cmd_duration = {
        style = "bold blue";
        disabled = false;
      };
      line_break = {
        style = "bold blue";
        disabled = false;
      };
      jobs = {
        style = "bold blue";
        disabled = false;
      };
      character = {
        style = "bold blue";
        disabled = false;
      };
    };
  };

  home.packages = with pkgs; [
    cowsay
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
