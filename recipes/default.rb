bash 'write hostsfile' do
  user 'root'
  group 'root'
  cwd '/root'
  code <<-EOF
  echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
  echo "$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/' ) #{node['ws-base']['cname']}.#{node['ws-base']['domain']} #{node['ws-base']['cname']}" >> /etc/hosts
  EOF
  #not_if 'test -s /etc/hosts'
end

bash 'write resolv.conf' do
  user 'root'
  group 'root'
  cwd '/root'
  code <<-EOF
  echo 'nameserver #{node['ws-base']['dns']}' > /etc/resolv.conf
  echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
  echo 'search #{node['ws-base']['domain']}' >> /etc/resolv.conf
  EOF
  #not_if 'test -s /etc/resolv.conf'
end

include_recipe 'apt'

package 'unzip'
