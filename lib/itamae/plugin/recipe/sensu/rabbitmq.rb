# Install & Configure RabbitMQ

rabbitmq_node = node[:sensu][:core][:rabbitmq]

node.reverse_merge!(
  rabbitmq: {
    vhost: rabbitmq_node[:vhost],
    user: {
      name: rabbitmq_node[:user],
      password: rabbitmq_node[:password],
      tag: 'monitoring'
    },
    plugins: %w(rabbitmq_management rabbitmq_management_visualiser)
  }
)

include_recipe 'rabbitmq::package'
include_recipe 'rabbitmq::plugins'
