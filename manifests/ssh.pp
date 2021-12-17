class exportedresourcessh::ssh(
  String $hostname,
  String $sshdsakey,
) {
  # Declare
  @@sshkey { $hostname:
    type => dsa,
    key  => $sshdsakey,
  }
}
