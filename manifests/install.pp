class foreman_proxy::install {
  if ! $foreman_proxy::custom_repo {
    class { '::foreman::install::repos': use_testing => $foreman_proxy::use_testing }
  }

  package {'foreman-proxy':
    ensure  => present,
    require => $foreman_proxy::custom_repo ? { true => [], default => Class['foreman::install::repos'] },
  }
}
