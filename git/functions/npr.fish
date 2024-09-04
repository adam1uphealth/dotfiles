function npr -d "open a pull request in the github web app"
    type -qs gh; or echo ":: Requires 'gh' cli tool."
    type -qs gsed; or echo ":: Requires 'gsed' cli tool."
    gh pr create -w -t "$(git branch --show-current | gsed -e 's/-/ /2g' -e 's/\b./\u&/g' -nre 's/^(\S*) (.*)$/[\1] \2/ip')"
end
