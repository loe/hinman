if Rails.env.development?
  Facebooker2.load_facebooker_yaml
else
  Facebooker2.configuration = {
    :app_id => ENV['FB_APP_ID'],
    :secret => ENV['FB_SECRET']
  }
end
