require_relative '../spec_helper'

describe command('sudo -i -u ubuntu ssh localhost exit') do
  its(:exit_status) { should eq 0 }
end
