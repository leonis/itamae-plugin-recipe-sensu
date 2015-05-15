# itamae-plugin-recipe-sensu

[Itamae](https://github.com/itamae-kitchen/itamae) plugin to install & configure sensu.

**WARNING**: Under development yet !

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

#### `sensu::redis` recipe

Install & configure redis.

```
# your recipe
include_recipe 'sensu::redis'
```

NOTE: depends on [itamae-plugin-recipe-redis](https://github.com/leonis/itamae-plugin-recipe-redis) plugin.

#### `sensu::rabbitmq` recipe

Install RabbitMQ.

```
# your recipe
include_recipe 'sensu::rabbitmq'
```

NOTE: depends on [itamae-plugin-recipe-rabbitmq](https://github.com/leonis/itamae-plugin-recipe-rabbitmq) plugin.

#### `sensu::package` recipe

Install sensu package.

```
# your recipe
include_recipe 'sensu::package'
```

#### `sensu::client_service` recipe

Enable sensu-client service.

```
# your recipe
include_recipe 'sensu::client_service'
```

#### `sensu::server_service` recipe

Enable sensu-server service.

```
# your recipe
include_recipe 'sensu::server_service'
```

#### `sensu::api_service` recipe

Enable sensu-api service.

```
# your recipe
include_recipe 'sensu::api_service'
```

### Node

See `attribuets/defaults.yml` about default values.

#### Installation

| name | description |
|:-----|:------------|
|node.sensu.user | The user who owns all Sensu files and directories. Default 'sensu' |
|node.sensu.group | The group that owns all Sensu files and directories. Default 'sensu' |
|node.sensu.use_embedded_ruby | The flag means whether Sensu ruby handlers and plugins use the embedded ruby in the Sensu package, or not use. (default: true) |
|node.sensu.log_directory | Sensu log directory. |
|node.sensu.log_level | Sensu log level (default: info) |
|node.sensu.service_max_wait | How long service scripts should wait for Sensu to start/stop |

#### RabbitMQ

| name | description |
|:-----|:------------|
|node.sensu.rabbitmq.host | RabbitMQ host |
|node.sensu.rabbitmq.port | RabbitMQ port |
|node.sensu.rabbitmq.vhost | RabbitMQ vhost for Sensu |
|node.sensu.rabbitmq.user | RabbitMQ user for Sensu |
|node.sensu.rabbitmq.password | RabbitMQ password for Sensu |

- **WARNING**: This plugin does not support configuration about RabbitMQ ssl. This may be cause of Security Issue.
- **WARNING**: `sensu.core.rabbitmq.port` attribute is not used yet...

#### Redis

| name | description |
|:-----|:------------|
|node.sensu.redis.host | Redis host |
|node.sensu.redis.port | Redis port |

#### Sensu API

| name | description |
|:-----|:------------|
|node.sensu.api.host | Sensu API host, for other services to reach it. |
|node.sensu.api.bind | Sensu API bind address |
|node.sensu.api.port | Sensu API port |



## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-plugin-recipe-sensu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright 2015 Leonis & Co.

MIT License
