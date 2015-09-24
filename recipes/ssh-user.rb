group "#{node['ws-base']['ssh-group']}" do

end

user "#{node['ws-base']['ssh-user']}" do
  group "#{node['ws-base']['ssh-group']}"
  home "#{node['ws-base']['ssh-userhome']}"
  manage_home true
  shell '/bin/bash'
end

directory "#{node['ws-base']['ssh-userhome']}/.ssh" do
  owner "#{node['ws-base']['ssh-user']}"
  group "#{node['ws-base']['ssh-group']}"
  mode '700'
end

cookbook_file 'id_rsa' do
  path "#{node['ws-base']['ssh-userhome']}/.ssh/id_rsa"
  owner "#{node['ws-base']['ssh-user']}"
  group "#{node['ws-base']['ssh-group']}"
  mode '600'
end

cookbook_file 'id_rsa.pub' do
  path "#{node['ws-base']['ssh-userhome']}/.ssh/id_rsa.pub"
  owner "#{node['ws-base']['ssh-user']}"
  group "#{node['ws-base']['ssh-group']}"
  mode '644'
end

cookbook_file 'id_rsa.pub' do
  path "#{node['ws-base']['ssh-userhome']}/.ssh/authorized_keys"
  owner "#{node['ws-base']['ssh-user']}"
  group "#{node['ws-base']['ssh-group']}"
  mode '600'
end

cookbook_file 'ssh-config' do
  path "#{node['ws-base']['ssh-userhome']}/.ssh/config"
  owner "#{node['ws-base']['ssh-user']}"
  group "#{node['ws-base']['ssh-group']}"
  mode '644'
end

cookbook_file "sudoers" do
  path "/etc/sudoers.d/#{node['ws-base']['ssh-user']}"
  owner 'root'
  group 'root'
  mode '644'
end

bash 'fill sudoers' do
  user 'root'
  cwd '/etc/sudoers.d'
  code <<-EOF
  echo -e "#{node['ws-base']['ssh-user-sudo']}" >> #{node['ws-base']['ssh-user']}
  EOF
end
