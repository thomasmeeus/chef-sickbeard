include_recipe 'apt::default'
include_recipe 'git::default'

ssh_known_hosts_entry 'github.com'

package 'python-cheetah'

git "#{node['sickbeard']['location']}/sickbeard" do
  repository 'https://github.com/midgetspy/Sick-Beard.git'
  action :sync
  notifies :restart, 'service[sickbeard]'
end

link '/etc/init.d/sickbeard' do
  to "#{node['sickbeard']['location']}/sickbeard/init.ubuntu"
end

template '/etc/default/sickbeard' do
  source 'default_sickbeard.erb'
end

service 'sickbeard' do
  action :stop
end

template "#{node['sickbeard']['location']}/sickbeard/config.ini" do
  source 'config.ini.erb'
  notifies :restart, 'service[sickbeard]'
end

service 'sickbeard' do
  action :start
end

bash 'update-rc.d' do
  code 'update-rc.d sickbeard defaults'
end
