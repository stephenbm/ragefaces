module Ragefaces
  class Engine < Rails::Engine
      initializer "ragefaces.assets.precompile" do |app|
        app.config.assets.precompile += %w(*.png)
        app.config.assets.precompile += %w(*.gif)
      end
  end
end
