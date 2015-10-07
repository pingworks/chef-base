group "#{node['pw_base']['ssh-group']}" do

end

user "#{node['pw_base']['ssh-user']}" do
  group "#{node['pw_base']['ssh-group']}"
  home "#{node['pw_base']['ssh-userhome']}"
  manage_home true
  shell '/bin/bash'
end

directory "#{node['pw_base']['ssh-userhome']}/.ssh" do
  owner "#{node['pw_base']['ssh-user']}"
  group "#{node['pw_base']['ssh-group']}"
  mode '700'
end

cookbook_file 'id_rsa' do
  path "#{node['pw_base']['ssh-userhome']}/.ssh/id_rsa"
  owner "#{node['pw_base']['ssh-user']}"
  group "#{node['pw_base']['ssh-group']}"
  mode '600'
end

cookbook_file 'id_rsa.pub' do
  path "#{node['pw_base']['ssh-userhome']}/.ssh/id_rsa.pub"
  owner "#{node['pw_base']['ssh-user']}"
  group "#{node['pw_base']['ssh-group']}"
  mode '644'
end

cookbook_file 'id_rsa.pub' do
  path "#{node['pw_base']['ssh-userhome']}/.ssh/authorized_keys"
  owner "#{node['pw_base']['ssh-user']}"
  group "#{node['pw_base']['ssh-group']}"
  mode '600'
end

cookbook_file 'ssh-config' do
  path "#{node['pw_base']['ssh-userhome']}/.ssh/config"
  owner "#{node['pw_base']['ssh-user']}"
  group "#{node['pw_base']['ssh-group']}"
  mode '644'
end

cookbook_file "sudoers" do
  path "/etc/sudoers.d/#{node['pw_base']['ssh-user']}"
  owner 'root'
  group 'root'
  mode '644'
end

bash 'fill sudoers' do
  user 'root'
  cwd '/etc/sudoers.d'
  code <<-EOF
  echo -e "#{node['pw_base']['ssh-user-sudo']}" >> #{node['pw_base']['ssh-user']}
  EOF
end
