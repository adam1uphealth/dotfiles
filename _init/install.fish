#!/usr/bin/env fish

set -Ux EDITOR vim
set -Ux VEDITOR code
set -Ux VISUAL code

set -Ux DOTFILES ~/.dotfiles
set -Ux WORK ~/work

fish_add_path -a $DOTFILES/bin $HOME/.bin $HOME/.local/bin

for f in $DOTFILES/*/functions
    if not contains $f $fish_function_path
        set -Up fish_function_path $f
    end
end

for f in $DOTFILES/*/conf.d/*.fish
    ln -sf $f $__fish_config_dir/conf.d/(basename $f)
end

if test -f ~/.localrc.fish
    ln -sf ~/.localrc.fish $__fish_config_dir/conf.d/localrc.fish
end
