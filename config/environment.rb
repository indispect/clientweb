# Load the rails application
require File.expand_path('../application', __FILE__)
Clientweb::Application.configure do
  config.action_dispatch.session = {
    :key    => '_app_session',
    :secret => '0x0dkfj3927dkc7djdh36rkckdfzsg...'
  }
end
# Initialize the rails application
Clientweb::Application.initialize!
