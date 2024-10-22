seed_conf_directories () {
  mkdir --parents ~/.config/{ohmyposh,postgres,nvim/lua/custom}
}

krefresh() {
  local node=$1

  lxc file pull $node/etc/kubernetes/admin.conf ~/.kube/config
}
