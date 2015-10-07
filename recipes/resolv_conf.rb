# Calculate a list of searchdomains for dns requests from
# the actual domain and the basedomain
domain = node['pw_base']['domain']
basedomain = node['pw_base']['basedomain']
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
  echo 'nameserver #{node['pw_base']['dns']}' > /etc/resolv.conf
  echo 'search #{searchdomainstring}' >> /etc/resolv.conf
  EOF
  #not_if 'test -s /etc/resolv.conf'
end
