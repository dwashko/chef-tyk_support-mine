#
# Cookbook Name:: tyk_support
# Recipe:: redis-tyk-monitor 
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

include_recipe 'datadog::dd-agent'

# Integrate Redis-tyk cluster apikey-* and cache-* metrics
# into Datadog.
#
# Set up attributes following this example (in scalr):
#
# node.datadog.redis-tyk.instances = [
#                        {
#                           "host" => "localhost",
#                           "port" => "6379",
#                           "tags" => ["some_tag"]
#                        }

datadog_monitor 'redis-tyk' do
  instances node['datadog']['redis-tyk']['instances']
end

template '/opt/datadog-agent/agent/checks.d/redis-tyk' do
  cookbook 'tyk_support'
  action :create
  owner 'dd-agent'
  source 'redis-tyk.py.erb'
end
