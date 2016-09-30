Rails.application.config.x.settings["oauth2"] = {} if Rails.env.test?

# [START omniauth_configuration]
Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load_file(Rails.root.join('config/settings.yml'))[Rails.env]

  provider :google_oauth2,
           config['oauth2']['client_id'],
           config['oauth2']["client_secret"],
           image_size: 150

end