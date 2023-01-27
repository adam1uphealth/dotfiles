function fishup -d "Run bootstrap.fish script"
    pushd $DOTFILES;
      and eval "$DOTFILES/script/bootstrap.fish";
      and popd;
end