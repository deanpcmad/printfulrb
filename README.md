# PrintfulRB

**This library is a work in progress**

PrintfulRB is a Ruby library for interacting with the Printful API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'printfulrb'
```

## Usage

### Authentication

The Printful API requires authentication with an access token.

```ruby
@client = Printful::Client.new(access_token: "abc123")
```

### Stores

```ruby
# Retrieve a list of stores depending on token access
@client.stores.list

# Retrieve store info
@client.stores.retrieve id: 123
```

### Catalog

```ruby
# Retrieve a list of Products available on Printful
@client.catalog.products
@client.catalog.products(category: 123)

# Retrieve a product by its ID
@client.catalog.product id: "123"

# Retrieve information for a variant
@client.catalog.variant id: "123"

# Retrieve information about size guides for a product
@client.catalog.product_sizes id: "123"

# Retrieve a list of Catalog Categories on Printful
@client.catalog.categories

# Retrieve a category by its ID
@client.catalog.category id: "123"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/printfulrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
