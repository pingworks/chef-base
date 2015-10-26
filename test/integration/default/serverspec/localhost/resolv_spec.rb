require_relative '../spec_helper'

describe command('ping -c 1 pingworks.net') do
  its(:stdout) { should match /PING pingworks.net \(148.251.198.132\)/ }
  its(:exit_status) { should eq 0 }
end

describe file('/etc/resolv.conf') do
  it { should exist }
  its(:content) { should match /search test01.prod.pingworks.ws.net prod.pingworks.ws.net pingworks.ws.net ws.net/ }
  its(:content) { should match /nameserver 8.8.8.8/ }
end
