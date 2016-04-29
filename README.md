# goaccess.io Puppet Module
Simple module to add goaccess.io to your deployment through Puppet.

Note: I've tried to make things minimal as possible. if you have any suggestions to more proper methods, feel free to contribute.

## Usage
copy the folder to your puppet module directory and run the module installation.

Example when using puppet with vagrant.

Assuming you have already done necessary configurations to Vagrantfile to include puppet support.

Include the below to your main pp file to run the goaccess-puppet class.
```
class { goaccess-puppet:
  version => "0.9.8",
}
```

## Contributors

If anyone is interested in spending some time to make this better, feel free to contribute.
