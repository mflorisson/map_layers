namespace :map_layers do
  
  desc "Install development libraries"
  task :install_dev_lib do
    plugin_root =  File.join(File.dirname(__FILE__), "..")
    copy_files("/OpenLayers/lib", "/public/javascripts", plugin_root)
  end

  def copy_files(source_path, destination_path, plugin_root)
    rails_root = ( defined?(RAILS_ROOT)) ? RAILS_ROOT : Rails.root
    source, destination = File.join(plugin_root, source_path), File.join(rails_root, destination_path)
    FileUtils.mkdir(destination) unless File.exist?(destination)
    FileUtils.cp_r(source, destination)
  end

  desc "Remove development libraries"
  task :uninstall_dev_lib do
    FileUtils.rm_r(File.join(Rails.root, "/public/javascripts/lib"))
  end


end
