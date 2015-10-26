require_relative '../spec_helper'

describe command('hostname -f') do
  its(:stdout) { should match /test.test01.prod.pingworks.ws.net/ }
  its(:exit_status) { should eq 0 }
end

describe command('dnsdomainname') do
  its(:stdout) { should match /pingworks.ws.net/ }
  its(:exit_status) { should eq 0 }
end
