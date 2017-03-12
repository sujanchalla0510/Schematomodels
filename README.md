# Schematomodels

This will create activerecord database connection using the params passed
and read the informations schema from the database to create active record models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Schematomodels'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Schematomodels

## Usage

model_generator = Schematomodels::Generater.new(adapter, host, database, username, password)
model_generater.generate_models


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sujankumar0510/Schematomodels. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

