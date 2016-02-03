#
# Cookbook Name:: nic_iis
# Recipe:: iisdsc
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Enable the IIS role.
include_recipe 'nic_iis::lcm_setup_dsc_resource'
include_recipe 'nic_iis::add_dsc_resource'

dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name,  'web-server'
end

service "w3svc" do
  action [:enable, :start ]
end

template 'c:\inetpub\wwwroot\Default.htm' do
  source 'index.html.erb'
end