# Configure client_service
include_recipe 'sensu::package'

# Configure
template '/etc/sensu/conf.d/client.json' do
  source Itamae::Plugin::Recipe::Sensu.template_path('client.json.erb')
  owner 'sensu'
  group 'sensu'
  mode '644'
  variables(client: node[:sensu][:client])
end

service 'sensu-client' do
  action [:enable, :start]
end
