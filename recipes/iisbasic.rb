#
# Cookbook Name:: nic_iis
# Recipe:: iisbasic
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

service 'w3svc' do
  action [:enable, :start]
end

template 'c:\inetpub\wwwroot\Default.htm' do
  source 'index.html.erb'
end
