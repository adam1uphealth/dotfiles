# Abbreviations

abbr -a meet "open https://meet.google.com"
abbr -a gmail "open https://mail.google.com/mail/u/0/\#inbox"
abbr -a jira "open https://1uphealth.atlassian.net/jira/software/projects/AUTH/boards/45"
abbr -a cal "open https://calendar.google.com/calendar/u/0/r/week"
abbr -a jenkins "open https://1uphealth.okta.com/home/jenkins/0oakqdhynvyyUVOZj5d6/54539"

abbr -a creds-dev "gimme-aws-creds --profile dev"
abbr -a creds-prod "gimme-aws-creds --profile prod"
abbr -a creds-all "gimme-aws-creds --profile dev && gimme-aws-creds --profile prod"

abbr -a authcode "code ~/work/auth.code-workspace"
abbr -a authv2 "nvmo ~/work/internal/apps/auth-v2"
abbr -a authservice "nvmo ~/work/internal/apps/api/authService"
abbr -a systemservice "nvmo ~/work/internal/apps/api/systemService"
abbr -a userservice "nvmo ~/work/internal/apps/api/userService"
abbr -a authintegrations "nvmo ~/work/auth-integrations/1up-auth-integration-template"

# Completions
complete -c pgdev -f
complete -c pgdev -a "connect-only" -d "Connect via ssh to '1uphealthdev' PG database"
complete -c pgdev -a "open" -d "Open pgAdmin4 and copy password to clipboard"
complete -c pgdev -a "close" -d "Close ssh conncetion to '1uphealthdev' PG database"
complete -c pgdev -a "connect" -d "Connect via ssh to '1uphealthdev' PG and open pgAdmin4"
