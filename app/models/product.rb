class Product < ApplicationRecord
  validates_presence_of :name, :description, :price
  belongs_to :product_category
  belongs_to :restaurant


end
