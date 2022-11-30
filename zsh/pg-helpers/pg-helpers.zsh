function pg-dev-connect {
  if [[ ! $(mdfind -name 'kMDItemFSNam=="pgAdmin 4.app"') ]]; then
    print ':: `pgAdmin 4` is required; please install before using `pg-dev-connect`.'
    return 1;
  fi

  if ! pgrep pgAdmin &> /dev/null; then
    security find-generic-password -a adam1up -s pgadmin -w | pbcopy;
    open -a 'pgAdmin 4';
  fi

  if ! ssh -S $HOME/.ssh/pg-dev-socket -O check 1uppg-dev1 &> /dev/null; then
    ssh -M -S $HOME/.ssh/pg-dev-socket -fnNT 1uppg-dev1;
  else
    print ':: SSH tunnel to dev PG db already connected.';
  fi

  return 0;
}

function pg-dev-close {
  ssh -S $HOME/.ssh/pg-dev-socket -O exit 1uppg-dev1;
}
