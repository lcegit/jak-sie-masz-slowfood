class ChangePriceToBeFloatInProduct < ActiveRecord::Migration[5.1]
  def up
    change_column :products, :price, 'float USING CAST(price AS float)'
  end
end
