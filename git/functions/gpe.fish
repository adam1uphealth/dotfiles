function gpe -d "push an empty commit"
  git commit --allow-empty -m 'Empty commit to retrigger GitHub actions';
    and git push
end
