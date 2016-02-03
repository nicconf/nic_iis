#
# Cookbook Name:: nic_iis
# Recipe:: setdns
#
# Copyright (c) 2016 Niklas and Frederico, All Rights Reserved.

dsc_resource 'dnssetting' do
  resource :xDNSServerAddress
  property :Address, ['8.8.8.8', '8.8.4.4']
  property :AddressFamily, 'IPv4'
  property :InterfaceAlias, 'Ethernet 2'
end

