require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PjtFirstsns
  class Application < Rails::Application
    config.load_defaults 6.0

    config.time_zone = "Tokyo"
    config.i18n.load_path +=
      Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    config.i18n.default_locale = :ja

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
