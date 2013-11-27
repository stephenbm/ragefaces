module Ragefaces
  class Engine < Rails::Engine
      initializer "ragefaces.assets.precompile" do |app|
        app.config.assets.precompile += %w(rage-sprite.png)
      end
  end
end
