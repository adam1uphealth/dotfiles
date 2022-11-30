#!/usr/bin/env zsh

DOTFILES_ROOT=$(pwd -P);

info() {
  echo \[${(%):-%B} ' .. ' ${(%):-%b}\] $@;
}

user() {
  echo \[${(%):-%B} ' ?? ' ${(%):-%b}\] $@;
}

success() {
  echo \[${(%):-%B%F{green}} ' OK ' ${(%):-%b%f}\] $@;
}

abort() {
  echo \[${(%):-%B%F{yellow}} ABRT ${(%):-%b%f}\] $@;
  echo \[${(%):-%B%F{red}} FAIL ${(%):-%b%f}\] "dotfile setup failed!";
  exit 1;
}

link_file() {
  local old=$1
  local new=$2
  local backup=$3
  local newLink

  if [[ -e $new ]] && [[ -L $new ]]; then
    newLink=$(readlink $new)
    if [[ $newLink == $old ]]; then
      success "skipped $old";
      return;
    else
      mv $new $new.$backup \
        && success "moved $new to $new.$backup" \
        || abort "failed to backup $new to $new.$backup";
    fi
  fi

  mkdir -p $(dirname $new) \
    && ln -sf $old $new \
    && success "linked $old to $new" \
    || abort "could not link $old to $new"
}

install_dotfiles() {
  for src in $DOTFILES_ROOT/*/*.symlink; do
    link_file $src $HOME/.$(basename $src .symlink) backup \
      || abort "failed to link config file $src"
  done

  link_file $DOTFILES_ROOT/zsh/plugins $HOME/.zsh_plugins.txt backup \
    || abort "plugins"
}

install_dotfiles && success 'dotfiles' || abort 'dotfiles'


success 'dotfiles installed/updated!'

exec zsh;