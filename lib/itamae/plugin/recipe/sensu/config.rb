# Add config files for sensu server/client/api
include_recipe 'sensu::default'

template '/etc/sensu/config.json' do
  source Itamae::Plugin::Recipe::Sensu.template_path('config.json.erb')
  owner 'sensu'
  group 'sensu'
  mode '644'
  variables(
    rabbitmq: node.sensu.rabbitmq,
    redis:    node.sensu.redis,
    api:      node.sensu.api
  )
end
