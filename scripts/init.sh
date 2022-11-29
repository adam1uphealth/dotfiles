#!/usr/bin/env bash

dotfileDir=$(cd $(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")/.. && pwd)

_dot_cp()
{
  local relFilePath=$1
  local targetPath=$2

  cp $dotfileDir/$relFilePath $targetPath/.$(basename $relFilePath)
}

_dot_cp_all_files()
{
  local sourceDir=$1;
  local sourceDirname=$(basename $sourceDir)
  local targetDir=$2

  for f in $sourceDir/*; do
    if [[ ! -d $f ]]; then
      _dot_cp $sourceDirname/$(basename $f) $targetDir
    fi
  done
}

_copy_files_to_home()
{
  for dir in $dotfileDir/*; do
    if [[ -d $dir && $(basename $dir) != scripts ]]; then
      _dot_cp_all_files $dir $HOME;
    fi
  done
}

_init()
{
  _copy_files_to_home;
  exec zsh;
}

_init;
