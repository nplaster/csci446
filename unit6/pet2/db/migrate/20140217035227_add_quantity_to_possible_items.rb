class AddQuantityToPossibleItems < ActiveRecord::Migration
  def change
    add_column :possible_items, :quantity, :integer, default: 1
  end
end
