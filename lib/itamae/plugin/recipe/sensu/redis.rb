# Install Redis
include_recipe 'sensu::default'

node.reverse_merge!(
  redis: {
    port: node.sensu.redis.port
  }
)

include_recipe 'redis::package'
include_recipe 'redis::config'
include_recipe 'redis::enable'
