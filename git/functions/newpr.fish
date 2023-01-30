function newpr -d "open a pull request in the github web app"
    type -qs gh
        and gh pr create -w
        or echo ":: Requires 'gh' cli tool."
end