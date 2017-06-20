# OpenHouse

OpenHouse provides a module which simplifies implementing the Visitor design pattern on a type hierarchy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openhouse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openhouse

## Usage

Here is a simple example:

```ruby
class EmperorPenguin

  include OpenHouse::Acceptor

  attr_reader :weight

  def initialize(weight)
    @weight = weight
  end

end

class AnimalAnnouncerVisitor

  def visit_emperor_penguin(emperor_penguin)
    "This is an emperor penguin that weights #{emperor_penguin.weight} kg."
  end

end

animal  = EmperorPenguin.new(42)
visitor = AnimalAnnouncerVisitor.new

animal.accept_visitor(visitor)
```

An example with a full type hierarchy that shows more features can be found in the test files.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eugeniobruno/openhouse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

