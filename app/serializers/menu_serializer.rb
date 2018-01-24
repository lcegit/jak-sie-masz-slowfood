class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :restaurant
  has_many :product_categories
  has_many :products
end
