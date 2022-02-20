class exportedresourcessh::nagios_service {
  @@nagios_service { "check_zfs${::hostname}":
    use                 => 'generic-service',
    host_name           => $::fqdn,
    check_command       => check_nrpe_larglcheck_zfs,
    service_description => "check_zfs${::hostname}",
    target              => '/codetestfiles/nagios3/conf.d/nagios_service.cfg',
    notify              => Service[$nagios::params::nagios_service],
  }

  # the book does not mention package or service resources for Nagios because Nagios may not run on every node. It could run on one node and
  # manage state of services/packages on all other nodes, this would however rerquire each node to export a nagios resource which can be 
  # collected by the node running nagios. Hence above, we have not shown any package/service for Nagios
}
