# PlateValidator

A Ruby gem to validate vehicle registration plate serials in a variety of US states and eventually countries!

## Supported Locations

* **Cyan:** Work in progress
* **Blue:** Passenger plates only
* **Red:** Passenger and Non-passenger only
* **Green:** Full coverage (Passenger, Non-passenger, Optional)
* **Yellow:** Missing data
* **Gray:** Not yet supported

![](/img/US.svg)

## Scope

The current goal is to get all 50 US states supported completely,
with additional countries added as I find the time. When I say "supported completely",
I mean that *all currently revalidated (renewable)* plates can be validated with this gem.

The generic `#valid?` method is for validating if the number matches ***any*** of the patterns used,
it does not guarantee that it's valid for that year/plate type. Methods for more specific validation
will be implemented at a later date.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add plate_validator

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install plate_validator

## Usage

This gem can be used in 2 different ways. The first option is to manually specify the validator you wish to use:

```ruby
validator = PlateValidator::CaliforniaValidator.new
validator.valid?("1SAM123") # => true
validator.valid?("AB-12-YZ") # => false
```

Alternatively, you can get the correct validator for a location by passing in a symbol:

```ruby
validator = PlateValidator.from_sym(:utah)
validator.valid?("W88 6TP") # => true
validator.valid?("I157GG") # => true
validator.valid?("727-WYS") # => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yellowberryhn/plate_validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/yellowberryhn/plate_validator/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PlateValidator project's codebases, issue trackers and discord server is expected to follow the [code of conduct](https://github.com/yellowberryhn/plate_validator/blob/master/CODE_OF_CONDUCT.md).
