set -q fish_tmux_autostart || set fish_tmux_autostart true
set -q fish_tmux_autostart_once || set fish_tmux_autostart_once true
set -q fish_tmux_autoconnect || set fish_tmux_autoconnect true
set -q fish_tmux_autoquit || set fish_tmux_autoquit $fish_tmux_autostart

function _fish_tmux_run
  if test (count $argv) -gt 0
      command tmux $argv
      return $status
  end

  set -l tmux_cmd tmux

  if test $fish_tmux_autoconnect = true && tmux has-session &> /dev/null
      exec $tmux_cmd attach
  else
      exec $tmux_cmd new-session -s $(gum input --prompt="Session name: " --value=$fish_tmux_default_session_name)
  end
end

alias tmux=_fish_tmux_run

set -q fish_tmux_autostarted || set fish_tmux_autostarted false
if status is-interactive && ! fish_is_root_user
  if test -z $TMUX && test $fish_tmux_autostart = true && test -z $INSIDE_EMACS && test -z $EMACS && test -z $VIM && test ! $TERM_PROGRAM = 'vscode'
      if test $fish_tmux_autostart_once = false || test ! $fish_tmux_autostarted = true
          set -x fish_tmux_autostarted true
          _fish_tmux_run
      end
  end
end

abbr -a tad 'tmux attach -d -t'
abbr -a ts 'tmux new-session -s'
abbr -a tl 'tmux list-sessions'
abbr -a tksv 'tmux kill-server'
abbr -a tkss 'tmux kill-session -t'
