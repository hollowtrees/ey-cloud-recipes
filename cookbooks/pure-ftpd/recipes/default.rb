#
# Cookbook Name:: pure-ftpd
# Recipe:: default
#

enable_package "net-ftp/pure-ftpd"

package "net-ftp/pure-ftpd" do
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