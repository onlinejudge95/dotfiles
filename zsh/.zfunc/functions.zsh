seed_conf_directories () {
  mkdir --parents ~/.config/{ohmyposh,postgres,nvim/lua/custom}
}

krefresh() {
  local node=$1

  lxc file pull $node/etc/kubernetes/admin.conf ~/.kube/config
}

dev-session() {
  if [[ -z "$1" ]]; then
    echo "Usage: dev-session REPO"
    echo "Supported repos: dicehub|dotfiles|portfolio|invite|workout"
    return 1
  fi

  local repo=$1

  nohup kitty --session "~/.config/kitty/sessions/$repo.conf" > /dev/null 2>&1 & disown 
}
