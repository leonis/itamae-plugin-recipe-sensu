# Install sensu by package.
#
# See http://sensuapp.org/docs/0.18/install-repositories
#
require 'pathname'
require Pathname.new(__FILE__).join('../../sensu.rb')

case node[:platform]
when 'debian', 'ubuntu'
  execute 'add sensu repository' do
    command %(
wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add - &&
echo "deb     http://repos.sensuapp.org/apt sensu main" | sudo tee /etc/apt/sources.list.d/sensu.list
    )
    not_if 'ls /etc/apt/sources.list.d | grep sensu'
  end

  package 'sensu'

when 'redhat', 'fedora'
  execute 'add sensu repository' do
    command %(
echo '[sensu]
name=sensu
baseurl=http://repos.sensuapp.org/yum/el/$basearch/
gpgcheck=0
enabled=1' | sudo tee /etc/yum.repos.d/sensu.repo
    )
    not_if 'ls /etc/yum.repos.d | grep sensu'
  end

  package 'sensu'
else
  fail "Sorry, your platform is not supported yet: '#{node[:platform]}'"
end

execute 'set owner:group to sensu' do
  command 'chown -R sensu:sensu /etc/sensu'
  not_if '[ `find /etc/sensu ! -user sensu | wc -l` == 0 ]'
end
