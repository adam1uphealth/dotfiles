function bump {
  if [[ -n ${*[(r)(--help)|(-h)]} ]]; then 
    print ':: zsh function to bump npm package version and add changelog entries';
    print ':: --> Specify new version or semver increment type, then as many changelog entries as needed.';
    print ':: --> Access this help page with `-h` or `--help`';
    print '::';
    print ':: Example:';
    print ':: > bump [<newversion> | major | minor | patch] "Changelog entry 1" "Changelog entry 2" ...';
    return 0;
  fi

  if [[ ! -f package.json ]]; then 
    print ':: `bump` must be run in a valid Node project';
    return 1;
  fi

  # Bump package versions
  version=${$(npm version $1)//v/};

  # Build changelog message
  message=""
  for bullet in $@[2,-1];
  do
    message+="\\
* ${bullet}";
  done;

  # Insert version and message into changelog file
  sed -i '' "/# CHANGELOG/a\\
\\
## ${version}\\
${message}
 
" CHANGELOG.md;

  print $version;
}

function nvmo {
  if [[ -n ${*[(r)(--help)|(-h)]} ]]; then 
    print ':: zsh function to open an npm package with the Node version specified in package.json';
    print ':: --> Access this help page with `-h` or `--help`';
    print '::';
    print ':: Example:';
    print ':: > nvmo [ /full/path/to/project | ./relative/path/to/project ]';
    return 0;
  fi

  path_to_project=$1

  if [[ ! $(type nvm) || ! $(type node) ]]; then 
    print ':: `nvmo` requires `nvm` and `node` installed and in the PATH';
    return 1;
  elif [[ ! -f ${path_to_project}/package.json ]]; then 
    print ':: `nvmo` must target a valid Node project';
    return 1;
  fi

  pushd ${path_to_project};
  version=$(node -e "const package = require('./package.json'); const version = package.engines && package.engines.node || 12; console.log(version)");

  nvm use $version;
}