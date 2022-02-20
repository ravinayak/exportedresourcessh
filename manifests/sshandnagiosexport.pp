class exportedresourcessh::sshandnagiosexport {

  include accounts
  $sshdsakey = 'AAAAB3NzaC1kc3MAAACBAPk7qwWhqVwanajdxUHzyZoG6bwE3FoBGuMsfUy2bhJhnlwNmU0v+g0bjt5kLkMy+MFTjZrN0TifIRew+O3OHaNWkcvkjCCGsi9TWgu+dRi8PGUHYaUJqinyfMGDyAw9xDfZGOA+CrQPZ7pw9L0ObPEEln9XRKiZE5mpLoL185mRAAAAFQDogtU0F6uOncXs619cPYa1AGd4cwAAAIBWj1iK/jWP0GTFYZQ2OClLeIg4WaoTVmc1+zuznObgUM+ofNTdmmESr+N9pUfi6QgD+l3w0P4VYC28BLCrIKUz6P/2nOgjUkym0P2H2nfEOxzJh6tnVCpZeIDiT47a+23DTxxZfyRA2yDGwVbgSCzusS32vE7NuRmsR8l/TB04zQAAAIAE5QYQ66Q/06G9pdJ64Hw4qLeO8rTXu5JiKX++3BzwFIQR1uSAnqqVta3zmsusne4oGs2EbNRh1OUIgQB3gKCFclihrYbdYlV7H/VQICFgJeGc13L1H0mYiJs66+tAHkvNpRJGFay5m9Y+sWOIob3FcA1fBt/pOeXbwAR1Pkp6Mw=='

  accounts::user{ 'neo16':
    uid          => 10090,
    shell        => '/usr/bin/bash',
    system       => false,
    comment      => 'Neo-16 Nayak',
    sshkeys      => [$sshdsakey],
    sshkey_group => 'neo16',
    sshkey_owner => 'neo16'
  }

  Class { 'exportedresourcessh::ssh':
    sshdsakey => $sshdsakey,
    hostname  => $facts['fqdn'],
  }

  # Collector
  Exportedresourcessh::Ssh <| |>
  Exportedresourcessh::Nagios_service <| |>

  # In the above declaration although we have defined resource collectors, none of the exported resources will be realized until the class 
  # which houses them is declared
  # Virtual or exported resources are evaluated only in stages in which they are declared, not in which they are realized. What this means 
  # is that if we use a resource collector like above or realize function in the class, the puppet compiler will not evalulate the resource 
  # in stages in which the resources are realized like the class above but only in those stages in which the resources are declared, i.e the
  # manifest in which this class is included
}
