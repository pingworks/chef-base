node['pw_base']['gemrc-files'].each do |file|
  directory File.dirname(file) do
    owner 'root'
    group 'root'
    mode 00755
    recursive true
    action :create
  end

  template file do
    source 'gemrc.erb'
    owner 'root'
    group 'root'
    mode 00644
  end
end
