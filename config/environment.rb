# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Clientweb::Application.initialize!

config.action_dispatch.session = {
  :key    => '_app_session',
  :secret => '0x8cfvauh739op342en71hlkawq3x22...'
}
