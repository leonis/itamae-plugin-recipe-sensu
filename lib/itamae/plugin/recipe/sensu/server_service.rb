# Configure server_service
include_recipe 'sensu::package'
include_recipe 'sensu::config'

service 'sensu-server' do
  action [:enable, :start]
end
