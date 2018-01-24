class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :city, :post_code, :street_address
  belongs_to :restaurant_category, only: [name]
  
end
