node['pw_base']['gemrc-files'].each do |file|
  template file do
    source 'gemrc.erb'
    owner 'root'
    group 'root'
    mode 00644
  end
end
