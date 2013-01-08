include_recipe "apt::default"
include_recipe "git::default"

package "python-cheetah" do
  action :upgrade
end


directory  "/var/run/sickbeard" do
  owner node["sickbeard"]["user"]
  group node["sickbeard"]["group"]
  mode "0755"
  recursive true
  action :create
end

directory  "/home/#{node['sickbeard']['user']}/.sickbeard/" do
  owner node["sickbeard"]["user"]
  group node["sickbeard"]["group"]
  mode "0755"
  recursive true
  action :create
end

git "#{node['sickbeard']['location']}" do
  repository "git://github.com/midgetspy/Sick-Beard.git"
  reference "master"
  action :sync
end

template "/etc/init.d/sickbeard" do
    source "sickbeard.erb"
    mode 0755
    owner "root"
    group "root"
end

template "/etc/default/sickbeard" do
    source "default_sickbeard.erb"
    mode 0644
    owner "root"
    group "root"
end

execute "stop-sickbeard" do
  command "service sickbeard stop" ## only way to edit the config
  action  :run
  only_if  'pidof couchpotato'
end

template "/home/#{node['sickbeard']['user']}/.sickbeard/config.ini" do
  source "config.ini.erb"
  mode 0600
  owner node["sickbeard"]["user"]
  group node["sickbeard"]["group"]
  notifies :restart, 'service[sickbeard]'
end

service "sickbeard" do
  action :start
end
