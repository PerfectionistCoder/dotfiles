function __fish_complete_man
    set -l section ""
    set -l token (commandline -ct)
    set -l prev (commandline -pxc)
    set -e prev[1]
    while set -q prev[1]
        switch $prev[1]
            case '-**'

            case '*'
                set section (string escape --style=regex $prev[1])
                set section (string replace --all / \\/ $section)
        end
        set -e prev[1]
    end

    set -l exclude_fish_commands
    if test -z "$section" -o "$section" = 1
        set -e exclude_fish_commands
    end

    if test -n "$token"
        set -l --path man_path (manpath)
        for path in $man_path
            set -f files $path/**/$token*.$section*
            # @fish-lsp-disable-next-line 2001
            string replace -r '.*/([^/]+)\.(\d)[.a-z]*$' '$1\t$2' -- $files
        end

        if not set -ql exclude_fish_commands
            set -l files $__fish_data_dir/man/man1/*.1
            # @fish-lsp-disable-next-line 2001
            string replace -r '.*/([^/]+)\.1$' '$1\tfish command' -- $files
        end
    else
        return 1
    end
    return 0
end
