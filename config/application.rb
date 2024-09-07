require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HodaBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.available_locales = [:en, :ar]
    config.i18n.default_locale = :ar
  end
end
