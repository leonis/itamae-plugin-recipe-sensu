# Install & Configure RabbitMQ
include_recipe 'sensu::default'

rabbitmq_node = node.sensu.rabbitmq

node.reverse_merge!(
  rabbitmq: {
    vhost: rabbitmq_node.vhost,
    port: rabbitmq_node.port,
    user: {
      name: rabbitmq_node.user,
      password: rabbitmq_node.password,
      tag: 'monitoring',
      rights: {
        vhost: rabbitmq_node.vhost,
        conf: '.*',
        write: '.*',
        read: '.*'
      }
    },
    plugins: %w(rabbitmq_management rabbitmq_management_visualiser)
  }
)

include_recipe 'rabbitmq::package'
include_recipe 'rabbitmq::plugins'
include_recipe 'rabbitmq::config'
include_recipe 'rabbitmq::enable'
