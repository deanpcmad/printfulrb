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

If you have an account level token, you can set a Store ID like so:

```ruby
@client = Printful::Client.new(store_id: 123, access_token: "abc123")
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

### Products

```ruby
# Returns a list of products for a store
@client.products.list

# Retrieve a product
@client.products.retrieve id: 123123

# Create a product
# More info: https://developers.printful.com/docs/#operation/createSyncProduct
@client.products.create product: {name: "My Product"}, variants: [{variant_id: 4011, retail_price: "20.00", files: [{url: "http://myfileurl.com/file.png"}]}]

# Update a product
# More info: https://developers.printful.com/docs/#operation/updateSyncProduct
@client.products.update id: 123123, product: {name: "My Product"}, variants: [{variant_id: 4011, retail_price: "20.00", files: [{url: "http://myfileurl.com/file.png"}]}]

# Delete a product
@client.products.delete id: 123123
```

### Product Variants

```ruby
# Retrieve a variant
@client.variants.retrieve id: 123123

# Create a variant
# ID would be the Product ID
# More info: https://developers.printful.com/docs/#operation/createSyncVariant
@client.variants.create id: 123123, variant_id: 4011, retail_price: "20.00", files: [{url: "http://myfileurl.com/file.png"}]

# Update a variant
# More info: https://developers.printful.com/docs/#operation/updateSyncVariant
@client.variants.update id: 123123, retail_price: "25.00"

# Delete a variant
@client.variants.delete id: 123123
```

### Product Templates

```ruby
# List all product templates
@client.product_templates.list

# Retrieve a product template
@client.product_templates.retrieve id: 123123

# Delete a product template
@client.product_templates.delete id: 123123
```

### Orders

```ruby
# List all orders
@client.orders.list

# Retrieve an order
@client.order.retrieve id: 123123

# Create an order
# More info: https://developers.printful.com/docs/#operation/createOrder
@client.orders.create recipient: {}, items: []

# Estimate order costs
# More info: https://developers.printful.com/docs/#operation/estimateOrderCosts
@client.orders.estimate recipient: {}, items: []

# Update an order
# More info: https://developers.printful.com/docs/#operation/updateOrderById
@client.orders.update id: 123123, recipient: {}, items: []

# Cancel an order
@client.orders.cancel id: 123123

# Confirm an order
@client.orders.confirm id: 123123
```

### Files

```ruby
# Retrieve a file
@client.files.retrieve id: 123123

# Create a file
# More info: https://developers.printful.com/docs/#operation/addFile
@client.files.create url: "https://myfileurl.com/file.png"
```

### Shipping Rates

```ruby
# Returns available shipping options and rates for a given list of products
# More info: https://developers.printful.com/docs/#operation/calculateShippingRates
@client.shipping_rates.calculate recipient: {}, items: []
```

## Mockup Generator

This API is complex and you'll need to read through the [API docs](https://developers.printful.com/docs/#tag/Mockup-Generator-API)
to learn how to use it properly.

```ruby
# Retrieve a list of templates that can be used for client-side positioning
@client.mockup_generator.templates id: 123

# Retrieve a list of print files for a product
@client.mockup_generator.printfiles id: 123

# Create a Mockup Generator task
# This API is rate limited
# More info: https://developers.printful.com/docs/#operation/createGeneratorTask
@client.mockup_generator.create id: 123, variant_ids: [123], files: [{placement: "front", url: "https://host.com/file.png", position: {}}]

# Retrieve mockup generator task result
@client.mockup_generator.retrieve id: "abc123"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/printfulrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
