function default -d "print the stdin if not null or else the arguments to stdout"
    read stdin
    if test -n "$stdin"
        echo $stdin
    else
        echo $argv
    end
end
