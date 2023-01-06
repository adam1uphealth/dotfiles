function newalias {
  echo "alias $1=\"$2\"" >> ~/.dotfiles/zsh/alias/alias.plugin.zsh;
  exec zsh;
}

# Basic aliases!

alias zshrc="vim ~/.zshrc"
alias zsource="exec zsh"
alias python="python3"

alias cat="bat"
alias cleard="dirs -c"

# Git aliases

alias gmod='git merge origin/$(git_develop_branch)'
alias gstb="git stash branch"
alias grec="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(objectname:short)%(color:reset) (%(color:blue)%(committerdate:relative)%(color:reset)) %(color:green bold)%(refname:short)%(color:reset) %(contents:subject)' --count=10"
alias gpe="git commit --allow-empty -m 'Empty commit' && git push"

function gbname {
  name=$(git branch --show-current);
  echo $name | pbcopy;
  echo ":: Git branch '$name' save to clipboard\!";
}

alias newpr='gh pr create -w'

# 1up aliases
alias creds-dev="gimme-aws-creds --profile dev"
alias creds-prod="gimme-aws-creds --profile prod"
alias creds-all="creds-dev; creds-prod; gimme-aws-creds;"

alias authcode="code ~/work/auth.code-workspace"
alias authv2="nvmo ~/work/internal/apps/auth-v2"
alias authservice="nvmo ~/work/internal/apps/api/authService"
alias systemservice="nvmo ~/work/internal/apps/api/systemService"
alias userservice="nvmo ~/work/internal/apps/api/userService"
alias authintegrations="nvmo ~/work/auth-integrations/1up-auth-integration-template"

alias meet="open 'https://meet.google.com'"
alias gmail="open https://mail.google.com/mail/u/0/\#inbox"
alias jira="open 'https://1uphealth.atlassian.net/jira/software/projects/AUTH/boards/45'"
alias weather="curl wttr.in/philadelphia\?1o"
alias cal="open https://calendar.google.com/calendar/u/0/r/week"
