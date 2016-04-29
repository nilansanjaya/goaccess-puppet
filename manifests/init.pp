class goaccess-puppet($version) {

  package{'curl':
    ensure => present,
  }

  package{'tar':
    ensure => present,
  }

  package{'GeoIP-devel':
    ensure => present,
  }

  package{'ncurses-devel':
    ensure => present,
    notify  => Exec["download goaccess archive"],
  }

  exec {"download goaccess archive":
    command => "cd /var/tmp/ && { curl -O http://tar.goaccess.io/goaccess-$version.tar.gz ; cd -; }",
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => Package['curl'],
    onlyif => ["yum list installed | grep GeoIP","yum list installed | grep ncurses-devel"],
    notify  => Exec["extract goaccess archive"],
    refreshonly => true
  }

  exec {"extract goaccess archive":
    command => "cd /var/tmp/ && { tar -zxf goaccess-$version.tar.gz ; cd -; }",
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    require => Package['tar'],
    notify  => Exec["install goaccess"],
    refreshonly => true
  }

  exec {"install goaccess":
    command => "cd /var/tmp/goaccess-$version && ./configure --enable-geoip --enable-utf8 && make && make install",
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    notify  => Exec["remove temp files"],
    refreshonly => true
  }

  exec {"remove temp files":
    command => "rm /var/tmp/goaccess-$version.tar.gz",
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    notify  => Exec["remove temp files_2"],
    refreshonly => true
  }

  exec {"remove temp files_2":
    command => "rm -rf /var/tmp/goaccess-$version",
    path => '/usr/bin:/bin:/usr/sbin:/sbin',
    refreshonly => true
  }

}