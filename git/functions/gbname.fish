function gbname -d "copy current git branch to clipboard"
    set -l branch (git branch --show-current)
    echo $branch | pbcopy
    echo ":: Git branch '$branch' saved to clipboard!"
end