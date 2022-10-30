require "faraday"
require "json"

require_relative "printful/version"

module Printful

  autoload :Client, "printful/client"
  autoload :Collection, "printful/collection"
  autoload :Error, "printful/error"
  autoload :Resource, "printful/resource"
  autoload :Object, "printful/object"
  
  autoload :CatalogResource, "printful/resources/catalog"
  autoload :StoresResource, "printful/resources/stores"
  autoload :ProductsResource, "printful/resources/products"
  autoload :VariantsResource, "printful/resources/variants"

  autoload :Product, "printful/objects/product"
  autoload :ProductSize, "printful/objects/product_size"
  autoload :Category, "printful/objects/category"
  autoload :Variant, "printful/objects/variant"
  autoload :Store, "printful/objects/store"

end
