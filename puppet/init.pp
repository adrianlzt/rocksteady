exec { 'update_apt' :
  command => '/usr/bin/apt-get update',
  before => Class['apt'],
}

class { 'apt': }
apt::ppa { 'ppa:vbulax/collectd5': 
  before => Class['::collectd'],
}

class { '::collectd': }
class { 'collectd::plugin::write_graphite':
  graphitehost => '127.0.0.1',
}

class { 'graphite':
  gr_timezone => 'Europe/Madrid',
  secret_key => "claveSecreeeeeta",
  require => Class['apt'],
}

package { 'screen': 
  ensure => present,
  require => Class['apt'],
}
