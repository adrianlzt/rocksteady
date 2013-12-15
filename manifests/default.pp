exec { 'update_apt' :
  command => '/usr/bin/apt-get update',
  before => Class['apt'],
}

class { 'apt': }
apt::ppa { 'ppa:vbulax/collectd5': 
  before => Class['::collectd'],
}

class { '::collectd': }
class { 'collectd::plugin::amqp':
  amqphost => '127.0.0.1',
}

class { 'graphite':
  gr_timezone => 'Europe/Madrid',
  secret_key => "claveSecreeeeeta",
  gr_amqp_enable => 'True',
  gr_amqp_vhost => 'graphite',
  gr_amqp_user => 'graphite',
  gr_amqp_password => 'graphite',
  gr_amqp_exchange => 'metrics',
  gr_amqp_metric_name_in_body => 'True',
  require => Class['apt'],
}

package { 'screen': 
  ensure => present,
  require => Class['apt'],
}

class { '::rabbitmq': 
  require => Class['apt'],
}

rabbitmq_user { 'graphite':
  admin    => true,
  password => 'graphite',
  require => Class['::rabbitmq'],
}

rabbitmq_vhost { 'graphite':
  ensure => present,
  require => Class['::rabbitmq'],
}

rabbitmq_user_permissions { 'graphite@graphite':
  configure_permission => '.*',
  read_permission      => '.*',
  write_permission     => '.*',
  require => Class['::rabbitmq'],
}

