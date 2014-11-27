#
# Cookbook Name:: consul-test-helpers
# Recipe:: consul-template
#
# Copyright (C) 2014
#
#
#

include_recipe 'curl'

consul_template_config 'test' do
    templates [{
      source: '/tmp/test.config.ctmpl',
      destination: '/tmp/test.config',
      command: 'touch /tmp/consul-template-command-test'
   }]
end

template '/tmp/test.config.ctmpl' do
  source 'test.config.ctmpl.erb'
end

execute 'add test key/value' do
  command "curl -X PUT -d 'something' http://localhost:8500/v1/kv/test"
end
