Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['INSPIRE_TWITTER_KEY'], ENV['INSPIRE_TWITTER_SECRET']
  provider :facebook, ENV['INSPIRE_FB_ID'], ENV['INSPIRE_FB_KEY']
end
