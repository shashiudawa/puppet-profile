class profile::apache(
  Boolean $default_vhost = false,
  Hash $apache_vhost_servers,
  #Integer $port          = 80,
  #String $docroot        = '/var/www/test',
) {
  class { '::apache': 
    default_vhost => $default_vhost,
  }

  #::apache::vhost { 'shashiudawa1.mylabserver.com':
    #port    => $port,
    #docroot => $docroot,
    #}

  file { "${docroot}/index.html":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => 'Test page. This is a test',
  }
  create_resources(::apache::vhost, $apache_vhost_servers)
}
