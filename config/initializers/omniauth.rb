Rails.application.config.middleware.use OmniAuth::Builder do
  config.omniauth :google_oauth2, ENV['879814743635-vh18nkdmnjdfm29vlfoieo6h88ifg089.apps.googleusercontent.com'], ENV['zEwFIx9a0YhIqkNEH1I9wngo'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end