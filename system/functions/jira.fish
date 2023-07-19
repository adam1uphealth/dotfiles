function jira --description 'Utility for launching Jira in browser'
    argparse h/help -- $argv
    if test (count $_flag_help) -ge 1
        echo "Usage:     " (set_color -o blue) jira (set_color normal) "               Open default board"
        echo "           " (set_color -o blue) "jira ." (set_color normal) "             Open default project backlog"
        echo "           " (set_color -o blue) "jira backlog" (set_color normal) "       Open default project backlog"
        echo "           " (set_color -o blue) "jira iss-420" (set_color normal) "       Open specific issue (case-insensitive)"
        echo "           " (set_color -o blue) "jira iss 420" (set_color normal) "       Open specific issue (case-insensitive)"
        echo "Variables: " (set_color -o green) _jira_default_board (set_color normal) "URL of default Jira board"
        return 0
    end

    if test (count $argv) -eq 0
        test -n "$_jira_default_board" \
            && open $_jira_default_board \
            || echo (set_color -o red) "_jira_default_board variable must be set." (set_color normal)
    else if contains backlog $argv
        open "$_jira_default_board/backlog?issueLimit=100"
    else if contains . $argv
        string match -rq '^(?<project>[a-zA-Z]+)-(?<issue>\d+)' (git branch --show-current)
        open "https://1uphealth.atlassian.net/browse/$project-$issue"
    else
        set -l issue (string join "-" $argv[1] $argv[2])
        open "https://1uphealth.atlassian.net/browse/$issue"
    end
end
