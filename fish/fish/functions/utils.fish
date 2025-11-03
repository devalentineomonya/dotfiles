function vmrss_watch
    set pid (pgrep -f $argv[1] | head -n 1)

    if test -z "$pid"
        echo "No process found for: $argv[1]"
        return 1
    end

    echo "Monitoring PID $pid ($argv[1])..."
    env VMRSS_MONITOR=1 vmrss "$pid"
end

