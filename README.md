# MethodMatchable

[![CircleCI](https://circleci.com/gh/kokuyouwind/method_matchable.svg?style=svg)](https://circleci.com/gh/kokuyouwind/method_matchable)
[![Gem Version](https://badge.fury.io/rb/method_matchable.svg)](https://badge.fury.io/rb/method_matchable)

Match with methods in hash patterns!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'method_matchable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install method_matchable

## Usage


```ruby
Person = Struct.new(:first_name, :last_name) do
  include MethodMatchable::Base

  def full_name
    "#{first_name} #{last_name}"
  end
end

case Person.new('Hotaru', 'Shiragiku')
in { full_name: name }
  p name # => 'Hotaru Shiragiku'
end

# You can use both original keys and method keys
class Hash
  prepend MethodMatchable::Base
end

case { key: :value}
in { key: v, size: size}
  p v # => :value
  p size # => 1
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kokuyouwind/method_matchable.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
