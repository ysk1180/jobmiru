require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jobmiru
  class Application < Rails::Application

    # rails g実行時にhelper、test、js、scssを作らない設定（芝田さんアドバイスに基づき記載）
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        request_specs: false
      g.helper false
      g.assets false
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # 日本語化
    config.i18n.default_locale = :ja

    # タイムゾーン設定：日本
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.serve_static_assets = true
  end
end
