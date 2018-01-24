class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :post_code, :street_address
  belongs_to :restaurant_category, only: [name]
  has_many :menus
  has_many :product_categories
  has_many :products
end
