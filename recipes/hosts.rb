bash 'write hostsfile' do
  user 'root'
  group 'root'
  cwd '/root'
  code <<-EOF
  echo "127.0.0.1 localhost" > /etc/hosts
  echo "#{node['ipaddress']} #{node['pw_base']['cname']}.#{node['pw_base']['domain']} #{node['pw_base']['cname']} #{node['hostname']}" >> /etc/hosts
  EOF
  #not_if 'test -s /etc/hosts'
end
