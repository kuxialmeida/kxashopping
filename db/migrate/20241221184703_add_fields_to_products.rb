class AddFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :discount, :decimal
    add_column :products, :rating, :decimal
    add_column :products, :sales, :integer
    add_column :products, :promotion, :boolean
  end
end
