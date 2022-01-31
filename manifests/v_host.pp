#
class apache::v_host (
  Array $sub_domain,
) {
  $sub_domain.each |String $sub_domain| {
    apache::vhost { $sub_domain:
      server_name   => "${sub_domain}.tobylinux.com",
      document_root => $sub_domain,
    }

    apache::ensite { $sub_domain:
      vhost_file => "${sub_domain}.tobylinux.com.conf",
      require    => Apache::Vhost[$sub_domain],
    }
  }
}
