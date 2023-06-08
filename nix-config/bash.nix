{ pkgs, ... }:

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
            hmul = "home-manager switch --flake ~/src/dotfiles";
            hmur = "home-manager switch --flake github:bderusha/dotfiles";
            grep = "grep --color=auto";
            egrep = "egrep --color=auto";
            fgrep = "fgrep --color=auto";
            ij = "flatpak run com.jetbrains.IntelliJ-IDEA-Community";
            k = "kubectl";
        };

        initExtra = ''
        

        ~/.nix-profile/bin/neofetch
        '';

        profileExtra = ''
        export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
        export PATH=$PATH:$HOME/.nix-profile/bin:$HOME/.pulumi/bin
        export NIX_PATH=$HOME/.nix-defexpr/channels
        export JAVA_HOME=/usr/bin/java
        if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi
        if [ -e ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then . ~/.nix-profile/etc/profile.d/hm-session-vars.sh; fi
        
        if [ -f ~/.nix-profile/share/bash-completion/completions/git ]; then
            source ~/.nix-profile/share/bash-completion/completions/git
            ___git_complete g __git_main
        fi
        '';

        historyIgnore = ["ls" "cd" "exit"];
    };
}
