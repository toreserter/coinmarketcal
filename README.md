# Coinmarketcal [![Gem Version](https://badge.fury.io/rb/coinmarketcal.svg)](https://badge.fury.io/rb/coinmarketcal)

Unofficial gem for the CoinMarketCal API
CoinMarketCal is the economic calendar for the cryptocurrency market. Evidence-based and community-driven.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coinmarketcal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coinmarketcal

## Usage

You can authenticate access to your CoinMarketCal account by configuring your implementation of the coinmarketcal gem. This is accomplished by using a config block at the top of your application.
Set up your keys at: https://api.coinmarketcal.com/developer/dashboard

```ruby
Coinmarketcal.config do |c|
  c.client_id = 'your-client-id'
  c.client_secret = 'your-client-secret'
end
```

To retrieve list of coins:
```ruby
Coinmarketcal::Coin.all
```

To retrieve list of events:
```ruby
Coinmarketcal::Event.all
```

To retrieve list of categories:
```ruby
Coinmarketcal::Category.all
```


## Contributing

1. Fork it ( https://github.com/toreserter/coinmarketcal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

