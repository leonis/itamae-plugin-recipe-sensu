# Itamae::Plugin::Recipe::Sensu

[Itamae](https://github.com/itamae-kitchen/itamae) plugin to install sensu.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-sensu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-sensu

## Usage

### Recipe

```
# your recipe
include_recipe 'sensu::redis'
include_recipe 'sensu::rabbitmq'

include_recipe 'sensu::package'

include_recipe 'sensu::client_service'

include_recipe 'sensu::server_service'
```

### Node

```
sensu:
  core:
    rabbitmq:
      host: localhost
      vhost: /sensu
      user: sensu
      password: secret
    redis:
      host: localhost
    api:
      port: 4567
  client:
    name: client_host_name
    address: client_ip_address
    subscriptions:
      - test
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-plugin-recipe-sensu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright 2015 Leonis & Co.

MIT License
