bash 'write hostsfile' do
  user 'root'
  group 'root'
  cwd '/root'
  code <<-EOF
  echo "127.0.0.1 localhost" > /etc/hosts
  echo "$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/' ) #{node['ws-base']['cname']}.#{node['ws-base']['domain']} #{node['ws-base']['cname']} $(hostname)" >> /etc/hosts
  EOF
  #not_if 'test -s /etc/hosts'
end

# Calculate a list of searchdomains for dns requests from
# the actual domain and the basedomain
domain = node['ws-base']['domain']
basedomain = node['ws-base']['basedomain']
domainparts = domain[0, domain.length-basedomain.length-1].split('.').reverse
searchdomains = [basedomain]
base = ""
domainparts.each{ |part|
  searchdomains.push(part + "." + base + basedomain)
  base+=part + "."
}
searchdomainstring = searchdomains.reverse.join(' ')

bash 'write resolv.conf' do
  user 'root'
  group 'root'
  cwd '/root'
  code <<-EOF
  echo 'nameserver #{node['ws-base']['dns']}' > /etc/resolv.conf
  echo 'search #{searchdomainstring}' >> /etc/resolv.conf
  EOF
  #not_if 'test -s /etc/resolv.conf'
end

include_recipe 'apt'

package 'unzip'
