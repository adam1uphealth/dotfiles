function bump -d "bump npm version and add to changelog"
    if ! command -qs npm
      echo ":: npm is required"
      exit 1
    end

    if ! test -f package.json
      echo ":: 'bump' must be run in a valid Node project"
      exit 1
    end

    echo "TODO"
end