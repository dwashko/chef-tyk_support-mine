require 'spec_helper'

describe file('/opt/datadog-agent/agent/checks.d/redis-tyk.py') do
  it { should be_file }
  it { should be_owned_by 'dd-agent' }
  its(:content) { should contain("Redis checks") }
end

describe file('/etc/dd-agent/conf.d/redis-tyk.yaml') do
  it { should be_file }
  it { should be_owned_by 'dd-agent' }
  its(:content) { should contain("port: 6379") }
end
