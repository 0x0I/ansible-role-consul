title "Consul source installation integration tests"

describe user('consul') do
  it { should exist }
end

describe group('consul') do
  it { should exist }
end

describe directory('/opt/consul') do
  it { should exist }
  its('owner') { should eq 'consul' }
  its('group') { should eq 'consul' }
end

describe file('/opt/consul/bin/consul') do
  it { should exist }
  its('owner') { should eq 'consul' }
  its('group') { should eq 'consul' }
  its('mode') { should cmp '0755' }
end

describe command('/usr/local/bin/consul -h') do
  its('exit_status') { should eq 0 }
end
