function bump -d "Bump npm version and add to changelog"
  if ! command -qs npm, gsed
    echo ":: npm and gsed are required"
    exit 1
  end
  if ! test -f package.json
    echo ":: 'bump' must be run in a valid Node project"
    exit 1
  end

  set -l pkg_version (command npm version $argv[1] | string trim -c v)
  gsed -i "/# CHANGELOG/a\\\n## $pkg_version\n$(string join "\\n* " "" $argv[2..-1])" CHANGELOG.md
  echo $pkg_version
end