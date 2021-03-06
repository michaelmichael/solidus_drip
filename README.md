# SolidusDrip

Solidus integration for [Drip](https://www.drip.com/)

## Installation

Add `solidus_drip` to your Gemfile:

```ruby
gem 'solidus_drip'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g solidus_drip:install
```

Add your Drip credentials as environment variables. Get your Drip API key [here](https://www.getdrip.com/user/edit).

```ruby
ENV['DRIP_API_KEY'] = 'YOUR_API_KEY'
ENV['DRIP_ACCOUNT_ID'] = 'YOUR_ACCOUNT_ID'
```

### Import Data

You can import all order data from your Solidus store to Drip via a rake task.
This should ideally only be run once.

```shell
rails drip:import_orders
```

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your application's integration with this extension you may use its factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_drip/factories'
```

## Releasing

Your new extension version can be released using `gem-release` like this:

```shell
bundle exec gem bump -v VERSION --tag --push --remote upstream && gem release
```

## References

- [Drip API Documentation](https://developer.drip.com/)

Copyright (c) 2019 Eric Saupe, released under the New BSD License
