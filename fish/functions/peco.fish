function peco_select_history
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  history | peco $peco_flags | read line
  if test $line
    commandline $line
  else
    commandline ''
  end
end

function peco_select_cd
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  set -l max_depth $PECO_SELECT_CD_MAX_DEPTH
  set -l ignore_case $PECO_SELECT_CD_IGNORE_CASE

  if test -z $max_depth
    set max_depth 3
  end

  if test -z $ignore_case
    find . -maxdepth $max_depth -type d 2>/dev/null | peco $peco_flags | read line
  else
    find . -maxdepth $max_depth -type d 2>/dev/null | egrep -v $ignore_case | peco $peco_flags | read line
  end

  if test $line
    cd $line
    commandline -f repaint
  end
end

function peco_select_ghq
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list -p | peco $peco_flags | read line
  if test $line
    cd $line
    commandline -f repaint
  end
end

function peco_select_k8s_context
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  kubectl config get-contexts --no-headers=true | awk '{print $2}'| peco $peco_flags | read line
  if test $line
    commandline "kubectl config use-context $line"
  else
    commandline ''
  end
end

function peco_select_k8s_namespace
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  kubectl get namespaces --no-headers=true | awk '{print $1}'| peco $peco_flags | read line
  if test $line
    commandline "kubectl config set-context (kubectl config current-context) --namespace=$line"
  else
    commandline ''
  end
end

function peco_select_tmux_window
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  tmux list-windows -F '#I: #{?window_active,*, } #W "#{pane_current_command} #{pane_current_path}"' | peco $peco_flags | awk -F':' '{print $1}' | read line
  if test $line
    tmux select-window -t $line
    commandline -f repaint
  end
end

function peco_select_z
  set -l query (commandline)
  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | sort -rn | cut -c 12- | peco $peco_flags | read line
  if test $line
    cd $line
    commandline -f repaint
  end
end
