#
# Cookbook Name:: tyk_support
# Spec:: default
#
# Copyright (c) 2016 Gannett Co., Inc, All Rights Reserved.

require 'spec_helper'

describe 'tyk_support::redis-tyk-monitor' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new do |node|
        node.set['datadog']['api_key'] = 'somekey'
        node.set['datadog']['redis-tyk']['instances'] = ['host'=> 'localhost']
      end
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes recipe datadog::dd-agent' do
      expect(chef_run).to include_recipe('datadog::dd-agent')
    end

    it 'adds the datadog_monitor for redis-tyk' do
      expect(chef_run).to add_datadog_monitor('redis-tyk')
    end

    it 'creates template /opt/datadog-agent/agent/checks.d/redis-tyk.py' do
      expect(chef_run).to create_template('/opt/datadog-agent/agent/checks.d/redis-tyk.py').with(
        source: 'redis-tyk.py.erb',
        owner: 'dd-agent',
      )
    end
  end
end
