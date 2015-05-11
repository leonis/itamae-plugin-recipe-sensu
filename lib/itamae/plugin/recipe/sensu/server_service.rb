# Configure server_service

include_recipe 'sensu::package'

# Configure
template '/etc/sensu/config.json' do
  source Itamae::Plugin::Recipe::Sensu.template_path('config.json.erb')
  owner 'sensu'
  group 'sensu'
  mode '644'
  variables(core: node[:sensu][:core])
end

service 'sensu-server' do
  action [:enable, :start]
end
