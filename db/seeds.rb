# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
Product.destroy_all
#
# FakeStoreAPI structure
# [
#   {
#     "id": integer,
#     "title": string
#     "price": float,
#     "description": string,
#     "category": string,
#     "image": string,
#     "rating": {
#       "rate": float,
#       "count": integer
#     }
#   }
# ]
#

conn = Requests::Http.base("https://fakestoreapi.com/products")
response = JSON.parse(conn.get.body)

response.each do |product|
  Product.create(
    name:               product["title"],
    description:        product["description"],
    rating:             product["rating"]["rate"],
    category:           product["category"],
    quantity_available: product["rating"]["count"],
    price:              product["price"],
    image:              product["image"]
  )
end

p "Created #{Product.count} Products of FakeStoreAPI"

#
# DummyJSON structure
# {
#   "products": [
#     {
#       "id": integer,
#       "title": string,
#       "description": string,
#       "price": integer,
#       "discountPercentage": float,
#       "rating": float,
#       "stock": integer,
#       "brand": string,
#       "category": string,
#       "thumbnail": string,
#       "images": [string]
#     }
#   ],
#   "total"=>integer,
#   "skip"=>integer,
#   "limit"=>integer
# }
#

conn = Requests::Http.base("https://dummyjson.com/products")
response = JSON.parse(conn.get.body)

response["products"].each do |product|
  Product.create(
    name:               product["title"],
    description:        product["description"],
    rating:             product["rating"],
    category:           product["category"],
    quantity_available: product["stock"],
    price:              product["price"],
    image:              product["thumbnail"]
  )
end

p "Created #{Product.count} Products of DummyJSON"
