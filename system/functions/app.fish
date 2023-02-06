function app -d "Find and open an app by name"
    open (find /Applications -iname "*$argv[1]*.app" -depth 1) 2> /dev/null
        or echo "'app' failed! Try opening it the normal way"
end