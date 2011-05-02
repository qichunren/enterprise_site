# encoding: utf-8 
require "theme_engine"
require "rails"
   
module ThemeEngine 
  
  class Engine < ::Rails::Engine
                 
    # configure our plugin on boot. other extension points such
        # as configuration, rake tasks, etc, are also available
        initializer "theme_engine.initialize" do |app|

          # subscribe to all rails notifications: controllers, AR, etc.
          ActiveSupport::Notifications.subscribe do |*args|
            event = ActiveSupport::Notifications::Event.new(*args)
            puts "Got notification: #{event.inspect}"
          end

        end

    
  end
  
end