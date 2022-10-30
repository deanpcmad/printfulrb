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
  autoload :ProductTemplatesResource, "printful/resources/product_templates"
  autoload :OrdersResource, "printful/resources/orders"
  autoload :FilesResource, "printful/resources/files"
  autoload :ShippingRatesResource, "printful/resources/shipping_rates"
  autoload :MockupGeneratorResource, "printful/resources/mockup_generator"

  autoload :Product, "printful/objects/product"
  autoload :ProductSize, "printful/objects/product_size"
  autoload :Category, "printful/objects/category"
  autoload :Variant, "printful/objects/variant"
  autoload :Store, "printful/objects/store"
  autoload :ProductTemplate, "printful/objects/product_template"
  autoload :Order, "printful/objects/order"
  autoload :Cost, "printful/objects/cost"
  autoload :File, "printful/objects/file"
  autoload :ShippingRate, "printful/objects/shipping_rate"
  autoload :MockupTask, "printful/objects/mockup_task"
  autoload :MockupPrintfile, "printful/objects/mockup_printfile"
  autoload :MockupTemplate, "printful/objects/mockup_template"

end
