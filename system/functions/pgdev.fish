function pgdev -d "Utility for connecting to PostgresQL DB"
    if test -z (mdfind -name 'kMDItemFSName=="pgAdmin 4.app"')
        echo "pgdev: \"pgAdmin 4\" is required; please install before using pgdev"
        return 1
    end

    set -l cmd $argv[1] 

    switch $cmd
        case "" -h --help
            echo "Usage: pgdev open         Open pgAdmin4 and copy password to clipboard"
            echo "       pgdev connect      Connect via ssh to '1uphealthdev' PG and open pgAdmin4"
            echo "       pgdev connect-only Connect via ssh to '1uphealthdev' PG database"
            echo "       pgdev close        Close ssh conncetion to '1uphealthdev' PG database"
        case open
            _open_pg_admin_4
        case connect
            _open_pg_admin_4
            _connect_1uphealthdev_pg
        case connect-only
            _connect_1uphealthdev_pg
        case close
            ssh -S $HOME/.ssh/pg-dev-socket -O exit 1uppg-dev1
        case '*'
            echo "pgdev: Unknown command: \"$cmd\" (see pgdev -h for usage)" >&2
            return 1
   end
end

function _open_pg_admin_4
    if test -z (pgrep pgAdmin)
        command security find-generic-password -a adam1up -s pgadmin -w | pbcopy
        open -a 'pgAdmin 4'
    else
        echo "pgdev: pgAdmin 4 already open!"
    end
end

function _connect_1uphealthdev_pg
  ssh -S $HOME/.ssh/pg-dev-socket -O check 1uppg-dev1 &> /dev/null
      and echo "pgdev: SSH tunnel to dev PG db already connected."
      or ssh -M -S $HOME/.ssh/pg-dev-socket -fnNT 1uppg-dev1 && echo "pgdev: SSH tunnel connected"
end
