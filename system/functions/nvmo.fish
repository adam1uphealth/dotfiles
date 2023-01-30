function nvmo -d "Open an npm package with specified Node version"
  set -l path_to_project $argv[1]

  if ! type -qs node, nvm
    echo ":: 'nvmo' requires nvm and node installed and in the path"
    return 1
  end
  if ! test -e $path_to_project/package.json
    echo ":: 'nvmo' must target a valid Node project"
    return 1
  end

  pushd $path_to_project
  set -l node_vzn (command node -e "const package = require('./package.json'); console.log(package.engines && package.engines.node || 14)")
  nvm use $node_vzn
end