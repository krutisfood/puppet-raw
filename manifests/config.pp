# Manage configuration for raw devices
class raw::config inherits raw {

  file {
    '/etc/raw':
      ensure  => $ensure,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('raw/raw.erb');
  }

}
