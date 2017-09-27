#
# Cookbook Name:: java-windows
# Recipe:: default
#

ENV['JAVA_HOME'] = node[:java][:windows][:java_home]
ENV['PATH'] = "#{node[:java][:windows][:java_home]}\\bin;#{ENV['PATH']}"

windows_package 'java' do
  source node[:java][:windows][:url]
  checksum node[:java][:windows][:checksum]
  
  installer_type :custom
  options "/s /v \"/qn INSTALLDIR=#{node[:java][:windows][:java_home]}\""

  not_if{
    File.exists?(node[:java][:windows][:java_home])
  }
end