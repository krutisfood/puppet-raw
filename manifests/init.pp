# Main raw class
class raw (
  $ensure  = $raw::params::ensure,
  $enable  = $raw::params::enable,
  $devices = ''
) inherits raw::params {

  validate_hash($devices)
  validate_string($ensure)
  validate_bool($enable)

  file {
    '/etc/raw':
      ensure  => $ensure,
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('raw.erb');
  }

  service {
    'raw':
      ensure      => $ensure,
      enable      => $enable,
      hasrestart  => false,
      stop        => '/bin/bash -c "echo It does not really have stop, only start"',
      subscribe   => [File['/etc/raw']];
  }
}
