# Abbreviations

abbr -a meet "open https://meet.google.com"
abbr -a gmail "open https://mail.google.com/mail/u/0/\#inbox"
abbr -a cal "open https://calendar.google.com/calendar/u/0/r/week"
abbr -a jenkins "open https://1uphealth.okta.com/home/jenkins/0oakqdhynvyyUVOZj5d6/54539"

abbr -a gimme "gimme-aws-creds -m"
abbr -a gimme6 "gimme-aws-creds -m -p 1up-dev6-admin"

abbr -a openvpn "app openvpn && command security find-generic-password -a adam1up -s openvpn -w | pbcopy"

abbr -a work "pushd $WORK"
abbr -a dot "pushd $DOTFILES"

# Completions
complete -c pgdev -f
complete -c pgdev -a connect-only -d "Connect via ssh to '1uphealthdev' PG database"
complete -c pgdev -a open -d "Open pgAdmin4 and copy password to clipboard"
complete -c pgdev -a close -d "Close ssh conncetion to '1uphealthdev' PG database"
complete -c pgdev -a connect -d "Connect via ssh to '1uphealthdev' PG and open pgAdmin4"
