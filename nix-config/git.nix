{
    programs.git = {
        enable = true;

        userName = "Bill DeRusha";
        userEmail = "444835+bderusha@users.noreply.github.com";

        signing = {
        key = "4124CF9C4C2FD977";
        signByDefault = true;
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
}