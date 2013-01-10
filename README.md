### Omniauth strategy for trello

An Omniauth strategy for Trello's OAuth authentication.

To Enable
---------

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trello, 'consumer_key', 'consumer_secret'
end
```
