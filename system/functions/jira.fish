function jira --description 'Utility for launching Jira in browser'
    set -l issue $argv[1]

    switch $issue
        case -h --help
            echo "Usage:     " (set_color -o blue) "jira" (set_color normal) "               Open default board"
            echo "           " (set_color -o blue) "jira iss-420" (set_color normal) "       Open specific issue (case-insensitive)"
            echo "Variables: " (set_color -o green) "_jira_default_board" (set_color normal) "URL of default Jira board"
        case ""
            test -n "$_jira_default_board" \
              && open $_jira_default_board \
              || (echo (set_color -o red) "_jira_default_board variable must be set." (set_color normal) && return 1)
               
        case '*'
            open "https://1uphealth.atlassian.net/browse/$issue"
    end
end
