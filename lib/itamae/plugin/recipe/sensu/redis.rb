# Install Redis
include_recipe 'sensu::base'

node.reverse_merge!(
  redis: {
    port: node[:sensu][:core][:redis][:port]
  }
)

include_recipe 'redis::package'
include_recipe 'redis::config'
include_recipe 'redis::enable'
