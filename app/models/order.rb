class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item

  def order_items
    shopping_cart_items
  end
end
