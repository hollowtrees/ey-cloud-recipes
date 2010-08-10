#
# Cookbook Name:: pure-ftpd
# Recipe:: default
#


package "net-ftp/pure-ftpd" do
  
  ey_cloud_report "pure-ftpd" do
    message "installing pure-ftpd package"
  end
  
  action :install
end

directory "/data/files" do
  owner node[:owner_name]
  group node[:owner_name]
  mode 0755
  recursive true
end

# execute "ensure-pure-ftpd-is-running" do
#   command %Q{
#     /usr/bin/pure-ftpd
#   }
#   not_if "pgrep pure-ftpd"
# end