function newpr -d "open a pull request in the github web app"
    command -qs gh;
        and gh pr create -w;
        or echo ":: Requires 'gh' cli tool.";
end