# Add config files for sensu server/client/api

node[:sensu][:core].reverse_merge!(

)

template '/etc/sensu/config.json' do
  source Itamae::Plugin::Recipe::Sensu.template_path('config.json.erb')
  owner 'sensu'
  group 'sensu'
  mode '644'
  variables(core: node[:sensu][:core])
end

template '/etc/sensu/conf.d/client.json' do
  source Itamae::Plugin::Recipe::Sensu.template_path('client.json.erb')
  owner 'sensu'
  group 'sensu'
  mode '644'
  variables(client: node[:sensu][:client])
end
