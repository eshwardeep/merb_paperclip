# make sure we're running inside Merb
if defined?(Merb::Plugins)
  dependency "activerecord"

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_paperclip] = {
    :chickens => false
  }
  
  Merb::BootLoader.before_app_loads do    
    require File.join(File.dirname(__FILE__), "paperclip")  
    Merb.add_generators(File.join(File.dirname(__FILE__), 'generators', 'paperclip_generator'))
  end
  
  Merb::BootLoader.after_app_loads do
  end
  
  Merb::Plugins.add_rakefiles "merb_paperclip/merbtasks"
end