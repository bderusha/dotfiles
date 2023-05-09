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
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
      export PATH=$PATH:~/.nix-profile/bin
      export NIX_PATH=$HOME/.nix-defexpr/channels
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi
      if [ -e ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then . ~/.nix-profile/etc/profile.d/hm-session-vars.sh; fi
    '';
    historyIgnore = ["ls" "cd" "exit"];
  };

  programs.git = {
    enable = true;

    userName = "Bill DeRusha";
    userEmail = "444835+bderusha@users.noreply.github.com";

    signing = {
      key = "~/.ssh/id_ed25519";
      # signByDefault = true;
    };
    
    aliases = {
      s = "status";
      a = "!git add . && git status";
      au = "!git add -u . && git status";
      aa = "!git add . && git add -u . && git status";
      c = "commit --signoff";
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
      init.defaultBranch = "main";
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
        show_milliseconds = false;
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
      username = {
        format = "[\\[$user\\]]($style)";
      };
      container.disabled = true;
      dotnet.disabled = true;
    };
  };

  programs.gpg.enable = true;
  programs.jq.enable = true;


  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  home.file.".config/neofetch/config.conf".text = ''
    # See this wiki page for more info:
    # https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
    print_info() {
        info title
        info underline

        info "OS" distro
        info "Host" model
        info "Kernel" kernel
        info "Uptime" uptime
        # info "Packages" packages
        info "Shell" shell
        info "Resolution" resolution
        info "DE" de
        info "WM" wm
        info "WM Theme" wm_theme
        info "Theme" theme
        info "Icons" icons
        info "Terminal" term
        info "Terminal Font" term_font
        info "CPU" cpu
        info "GPU" gpu
        info "Memory" memory

        # info "GPU Driver" gpu_driver  # Linux/macOS only
        # info "Disk" disk
        # info "Battery" battery
        # info "Font" font
        # info "Song" song
        # [[ "$player" ]] && prin "Music Player" "$player"
        info "Local IP" local_ip
        info "Public IP" public_ip
        # info "Users" users
        # info "Locale" locale  # This only works on glibc systems.

        info cols
    }
  '';
}
