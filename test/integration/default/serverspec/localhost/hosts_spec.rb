require_relative '../spec_helper'

describe command('hostname -f') do
  its(:stdout) { should match /ws.pingworks.net/ }
  its(:exit_status) { should eq 0 }
end

describe command('dnsdomainname') do
  its(:stdout) { should match /ws.pingworks.net/ }
  its(:exit_status) { should eq 0 }
end
