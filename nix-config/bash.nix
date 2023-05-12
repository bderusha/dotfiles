{
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
}