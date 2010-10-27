Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'INSPIRE_TWITTER_KEY', 'INSPIRE_TWITTER_SECRET'
  provider :facebook, 'INSPIRE_FB_ID', 'INSPIRE_FB_KEY'  
end
