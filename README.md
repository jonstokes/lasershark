# Lasershark

This gem fixes the interactor gem's context object so that you have to define it, and it's not just an OpenStruct. You'll declare a context object for each interactor, so that way if you try to call a setter or getter on it that doesn't exist, then instead of getting `nil` you get a real `MethodMissing` error.

Example:
```ruby
class CategorizeProducts
  include Lasershark

  context_with(
    Class.new(Lasershark::BaseContext) do
      attr_accessor :products, :categories, :categorized_products_count
    end
  )
  delegate :products, :categories, :categorized_products_count, to: :context

  def call
    products.each do |product|
      categorized_products_count += 1 if categorize_product(product, categories)
    end
  end
end
```

The above code creates a new class with `Lasershark::BaseContext` as its parent, and uses it as the context object for this interactor.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lasershark'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lasershark

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lasershark.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
