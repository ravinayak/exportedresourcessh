class exportedresourcessh::nagios_service {
  @@nagios_service { "check_zfs${::hostname}":
    use                 => 'generic-service',
    host_name           => $::fqdn,
    check_command       => check_nrpe_larglcheck_zfs,
    service_description => "check_zfs${::hostname}",
    target              => '/etc/nagios3/conf.d/nagios_service.cfg',
    notify              => Service[$nagios::params::nagios_service],
  }
  package { 'nagios':
    ensure => latest,
  }
  Service { 'nagios':
    ensure => running,
    enable => true,
  }
  Package['nagios'] -> Service['nagios'] -> Nagios_service["check_zfs${::hostname}"]
}
