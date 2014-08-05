# Manages the raw service
class raw::service inherits raw {

  service {
    'raw':
      ensure      => $service_ensure,
      enable      => $enable,
      hasrestart  => false,
      stop        => '/bin/bash -c "echo It does not really have stop, only start"',
      subscribe   => [File['/etc/raw']];
  }

}
