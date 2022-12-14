{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bill";
  home.homeDirectory = "/home/bill";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    cowsay
    neofetch
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -A";
      l = "ls -CF";
      ".." = "cd ..";
      g = "git";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
    };
    initExtra = ''
      ${pkgs.neofetch}/bin/neofetch
    '';
    historyIgnore = ["ls" "cd" "exit"];
  };

  programs.git = {
    enable = true;

    userName = "Bill DeRusha";
    userEmail = "444835+bderusha@users.noreply.github.com";

    signing = {
      key = "0B57198F6B12DE99";
      signByDefault = true;
    };
    
    aliases = {
      s = "status";
      a = "!git add . && git status";
      au = "!git add -u . && git status";
      aa = "!git add . && git add -u . && git status";
      c = "commit";
      ca = "commit --amend";
      cane = "commit --amend --no-edit";
      yolo = "!git add . && git commit --amend --no-edit --no-verify && git push --force-with-lease";
      l = "log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(white)- %an, %ar%Creset'";
      lg = "log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%an%d%Creset %s %Cgreen(%cr)%Creset' --date=relative";
      d = "diff --color-words";
      co = "checkout";
      sw = "switch";
      pro = "pull --rebase origin";
      po = "push origin";
      cp = "cherry-pick";
      ri = "!sh -c 'git rebase -i HEAD~$1' -";
      untrack = "update-index --assume-unchanged";
      track = "update-index --no-assume-unchanged";
    };
    # delta.enable = true;
    difftastic = {
      enable = true;
    };

    extraConfig = {
      core = {
        editor = "code --wait";
        autocrlf = "input";
      };
      color = {
        ui = "auto";
        status = "auto";
        branch = "auto";
        interactive = "auto";
        diff = "auto";
      };
      rerere.enabled = "true";
      branch.autosetuprebase = "always";
      push.default = "current";
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      cmd_duration = {
        format = "[⏱️ $duration]($style)";
        min_time = 5000;
        show_milliseconds = true;
      };
      directory = {
        read_only = " ";
        truncation_length = 8;
        truncate_to_repo = true;
      };
      git_branch = {
        symbol = " ";
        format = "[\\[$symbol$branch\\]]($style)";
      };
      git_status = {
        format = "[\\[$all_status$ahead_behind\\]]($style)";
      };
      nix_shell = {
        symbol = " ";
        format = "[\\[$symbol$state( \\($name\\))]($style)\\]";
      };
      python = {
        symbol = " ";
        format = "[\\[$symbol$version]($style)\\]";
      };
      sudo = {
        format = "[\\[as $symbol]\\]";
      };
      time = {
        format = "[\\[$time]($style)\\]";
      };
      dotnet.disabled = true;
    };
  };


  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
