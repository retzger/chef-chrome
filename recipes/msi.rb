chrome64 = node['kernel']['machine'] == 'x86_64' && !node['chrome']['32bit_only']
windows_package 'Google Chrome' do
  source chrome64 ? node['chrome']['msi_64'] : node['chrome']['msi']
  action :nothing
  only_if { (chrome_windows_version).empty? }
end.run_action(:install)
