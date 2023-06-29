# frozen_string_literal: true

require_relative "sharethis/version"
require "sharethis/helper"
require "sharethis/engine"

I18n.load_path += Dir.glob(File.dirname(__FILE__) + "lib/locales/*.{rb,yml}")

module Sharethis
  class Error < StandardError; end
end

ActiveSupport.on_load(:action_view) do
  include Sharethis::Helper
end
