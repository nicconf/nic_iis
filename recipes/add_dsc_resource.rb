#
# Cookbook Name:: nic_iis
# Recipe:: add_dsc_resource
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
powershell_script "Configure LCM for dsc_resource" do
  code <<-EOH
    install-module xWebAdministration -Force
  EOH
  only_if '(Get-DscResource -Module xWebAdministration).Count -eq 0 '
end