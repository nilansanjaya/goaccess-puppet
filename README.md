# goaccess.io Puppet Module
Simple module to add goaccess.io to your deployment through Puppet.

Note: I've tried to make things minimal as possible. if you have any suggestions to more proper methods, feel free to contribute.

## Usage
If you prefer installing through forge, run the below commands.

```
puppet module install nilansanjaya-goaccess_puppet
```

Include the below to your main pp file to run the goaccess-puppet class.
```
class { goaccess-puppet:
  version => "0.9.8",
}
```

## Contributors

If anyone is interested in spending some time to make this better, feel free to contribute.
