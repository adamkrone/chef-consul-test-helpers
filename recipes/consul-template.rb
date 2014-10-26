#
# Cookbook Name:: consul-test-helpers
# Recipe:: consul-template
#
# Copyright (C) 2014
#
#
#

include_recipe 'curl'

template '/tmp/test.ctmpl' do
  source 'test.ctmpl.erb'
end

execute 'add test key/value' do
  command "curl -X PUT -d 'something' http://localhost:8500/v1/kv/test"
end
