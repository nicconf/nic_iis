#
# Cookbook Name:: nic_iis
# Recipe:: lcm_setup_dsc_resource
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

powershell_script "Configure LCM for dsc_resource" do
  code <<-EOH
    [DscLocalConfigurationManager()]
    Configuration ConfigLCM
    {
        Node "localhost"
        {
            Settings
            {
                ConfigurationMode = "ApplyOnly"
                RebootNodeIfNeeded = $false
                RefreshMode = 'Disabled'
            }
        }
    }
    ConfigLCM -OutputPath "#{Chef::Config[:file_cache_path]}\\DSC_LCM"
    Set-DscLocalConfigurationManager -Path "#{Chef::Config[:file_cache_path]}\\DSC_LCM"
  EOH
  only_if '(Get-DscLocalConfigurationManager).RefreshMode -notlike "Disabled"'
end