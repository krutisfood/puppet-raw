# Main raw class
class raw (
  $ensure  = $raw::params::ensure,
  $enable  = $raw::params::enable,
  $devices = {}
) inherits raw::params {

  validate_hash($devices)
  validate_string($ensure)
  validate_bool($enable)

  $service_ensure = $ensure ? {
    'present' => 'running',
    default   => 'stopped'
  }

  anchor { 'raw::begin': } ->
  class { 'raw::config': } ~>
  class { 'raw::service': } ->
  anchor { 'raw::end': }

}
