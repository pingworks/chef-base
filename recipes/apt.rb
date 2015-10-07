# use archive.ubuntu.com
cookbook_file '/etc/apt/sources.list' do
  source 'sources-list'
  owner 'root'
  group 'root'
  mode 00644
end

# apt-get update
node.force_override['apt']['periodic_update_min_delay'] = 0
include_recipe 'apt'
