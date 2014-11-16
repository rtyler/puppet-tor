class tor (
	$socks                      = true,
	$socksport                  = '9050',
	$sockslistenaddresses       = '127.0.0.1',
	$sockspolicies              = [ {
			policy => 'accept',
			target => '192.168.0.0/16',
		}, {
			policy => 'reject',
			target => '*',
		} ],
	$dirservers                 = [],
	$usebridges                 = false,
	$updatebridgesfromauthority = true,
	$bridges                    = [],
	$relay                      = true,
	$orport                     = '9001',
	$orlistenaddress            = '0.0.0.0:9001',
	$nickname                   = 'ididnteditheconfig',
	$address                    = false,
	$bridge                     = false,
	$publishserverdescriptor    = true,
	$directory                  = false,
	$dirport                    = '9000',
	$dirlistenaddress           = '0.0.0.0:9000',
	$hidden_services            = [],
        $transPort                  = false,
        $transListenAddress         = '127.0.0.1',
        $dnsPort                    = false,
        $dnsListenAddress           = '127.0.0.1',
) {

	package { 'tor':
		ensure => installed,
	}

	file { '/etc/tor/torrc':
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		content => template('tor/torrc.erb'),
		require => Package['tor'],
		notify  => Service['tor'],
	}

	service { 'tor':
		ensure => running,
	}

}
