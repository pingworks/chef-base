cookbook_file '/root/.gemrc' do
  source 'gemrc'
  owner 'root'
  group 'root'
  mode 00644
end
