# Configure client_service
include_recipe 'sensu::package'
include_recipe 'sensu::config'

service 'sensu-client' do
  action [:enable, :start]
end
