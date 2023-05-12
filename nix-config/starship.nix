{
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
}