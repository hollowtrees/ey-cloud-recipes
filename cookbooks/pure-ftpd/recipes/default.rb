#
# Cookbook Name:: pure-ftpd
# Recipe:: default
#

# be sure to replace "appname" with the name of your application.
appname = "projects"

package "pure-ftpd" do
  action :install
end

directory "/data/files" do
  owner node[:owner_name]
  group node[:owner_name]
  mode 0755
  recursive true
end

run_for_app(appname) do |app_name, data|
  
  ey_cloud_report "pure-ftpd" do
    message "configuring pure-ftpd"
  end
  
  template "/etc/monit.d/pure-ftpd.monitrc" do
    source "pure-ftpd.monitrc.erb"
    owner node[:owner_name]
    group node[:owner_name]
    mode 0644
    variables({
      :app_name => app_name,
      :user => node[:owner_name]
    })
  end
  
  execute "monit quit"
  
end