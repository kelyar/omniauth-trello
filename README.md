### Omniauth strategy for trello

You'd better use ruby-trello for now )

To Enable
---------

 Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trello, 'consumer_key', 'consumer_secret'
 end
