# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  
  config.mailer_sender = 'cybergenie91@yahoo.co.uk'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 24.hours
  config.sign_out_via = :delete

  # ==> OmniAuth
  #Add your ID and secret here
  #ID first, secret second
  config.omniauth :facebook, "1554362851507931", ENV["FACEBOOK_APP_SECRET"], {:client_options => {:ssl => {:verify => false}}}
  
  require 'omniauth-linkedin'
  config.omniauth :linkedin, "78wdjhcflzl0sa", ENV["LINKEDIN_APP_SECRET"]

end
