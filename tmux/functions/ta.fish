function ta -d "smarter tmux attach"
  test $TMUX
      and echo 'tms should not be used within a tmux session!'
      and exit 1

  set --local session $argv[1]
  tmux has -t $session &> /dev/null
      and tmux attach -t $session
      or tmux new -s $(gum input --prompt="Session name: " --value=$session);
end
