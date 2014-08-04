puppet-raw
==========

Puppet module to manage linux raw devices

## Overview

The raw module handles installing, configuring, and running raw devices.

## Setup


### What raw affects

* raw configuration file.
* raw service.

## Usage

All interaction with the raw module can do be done through the main raw class.
This means you can simply toggle the options in `::raw` to have full functionality of the module.

###I just want raw, what's the minimum I need?

At least one device must be specified:

```
class { '::raw':
  devices => {
               '1' => { raw_device => 'hdb1' },
               '2' => { raw_device => 'hdb2' }
             }
}
```
