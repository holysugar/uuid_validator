# UuidValidator

UUID validator for ActiveModel

## Installation

Add this line to your application's Gemfile:

    gem 'uuid_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uuid_validator

## Usage

```ruby
class SomeModel
  include ActiveModel::Validations
  attr_accessor :key
  validates :key, :uuid => true
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
