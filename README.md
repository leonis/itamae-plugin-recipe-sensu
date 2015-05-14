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

```
sensu:
  core:
    rabbitmq:
      host: localhost
      port: 5672
      vhost: /sensu
      user: sensu
      password: secret
    redis:
      host: localhost
      port: 6379
    api:
      host: localhost
      port: 4567
      bind: 0.0.0.0
  client:
    name: client_host_name
    address: client_ip_address
    subscriptions:
      - test
```

| name | description |
|:-----------------------------|:-------------------------------|
| sensu.core.rabbitmq.host     | host for rabbitmq |
| sensu.core.rabbitmq.port     | port for rabbitmq |
| sensu.core.rabbitmq.vhost    | vhost of rabbitmq |
| sensu.core.rabbitmq.user     | user name for rabbitmq |
| sensu.core.rabbitmq.password | password for rabbitmq user |
| sensu.core.redis.host        | host for redis |
| sensu.core.redis.port        | port of redis |
| sensu.core.api.host          | host for sensu api |
| sensu.core.api.bind          | IP Address to be bound by sensu-api |
| sensu.core.api.port          | port of sensu-api |
| sensu.client.name            | sensu-client name (/etc/sensu/conf.d/client.json) |
| sensu.client.address         | IP Address of host (/etc/sensu/conf.d/client.json) |
| sensu.client.subscriptions   | names to subscribe the sensu-client |

See `attributes/defaults.yml`, about default value for each attributes.

**WARNING**: `sensu.core.rabbitmq.port` attribute is not used yet...

## Contributing

1. Fork it ( https://github.com/[my-github-username]/itamae-plugin-recipe-sensu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright 2015 Leonis & Co.

MIT License
