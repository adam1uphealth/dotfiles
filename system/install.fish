#!/usr/bin/env fish

if command -qa bat
	alias --save cat=bat
	set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

alias --save ls="ls -G"

set -Ux _jira_default_board "https://1uphealth.atlassian.net/jira/software/projects/AUTH/boards/45"
