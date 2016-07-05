name 'tyk_support'
maintainer 'Gannett Co., Inc'
maintainer_email 'paas-delivery@gannett.com'
license ' Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.'
description 'Installs/Configures tyk_support'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

# add any cookbook dependencies here
# depends 'other_cookbook_name'

supports 'centos'

source_url 'https://github.com/GannettDigital/chef-tyk_support'
issues_url 'https://github.com/GannettDigital/chef-tyk_support/issues'

depends 'datadog'
