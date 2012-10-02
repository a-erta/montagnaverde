# Load the rails application
require File.expand_path('../application', __FILE__)

Depot::Application.configure do
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:domain => "domain.of.sender.net",
:authentication => "plain",
:user_name => "alessandro.erta@gmail.com",
:password => "alexbest",
:enable_starttls_auto => true
}
end

# Initialize the rails application
Depot::Application.initialize!
