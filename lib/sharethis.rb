# frozen_string_literal: true

require_relative "sharethis/version"
require "sharethis/helper"

I18n.load_path += Dir.glob(File.dirname(__FILE__) + "lib/locales/*.{rb,yml}")

ActiveSupport.on_load(:action_view) do
  include Sharethis::Helper
end

module Sharethis
  class << self
    # Inspired by Kaminari
    def load!
      if rails?
        register_rails_engine
      elsif sprockets?
        register_sprockets
      end
    end

    # Paths
    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def stylesheets_path
      File.join assets_path, 'stylesheets'
    end

    def javascripts_path
      File.join assets_path, 'javascripts'
    end

    def images_path
      File.join assets_path, 'images'
    end

    def assets_path
      @assets_path ||= File.join gem_path, 'vendor', 'assets'
    end

    def sprockets?
      defined?(::Sprockets)
    end

    def rails?
      defined?(::Rails)
    end

    private

    def register_rails_engine
      require 'sharethis/engine'
    end

    def register_sprockets
      Sprockets.append_path(stylesheets_path)
      Sprockets.append_path(javascripts_path)
    end
  end
end

Sharethis.load!
