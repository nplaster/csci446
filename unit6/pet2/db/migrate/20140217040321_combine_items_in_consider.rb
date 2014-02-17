class CombineItemsInConsider < ActiveRecord::Migration
def up
    # replace multiple items for a single product in a cart with a single item
    Consider.all.each do |consider|
      # count the number of each product in the cart
      sums = consider.possible_items.group(:animal_id).sum(:quantity)

      sums.each do |animal_id, quantity|
        if quantity > 1
          # remove individual items
          consider.possible_items.where(animal_id: animal_id).delete_all

          # replace with a single item
          item = consider.possible_items.build(animal_id: animal_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
end

  def down
    # split items with quantity>1 into multiple items
    PossibleItem.where("quantity>1").each do |possible_item|
      # add individual items
      possible_item.quantity.times do 
        PossibleItem.create consider_id: possible_item.consider_id,
          product_id: possible_item.animal_id, quantity: 1
      end

      # remove original item
      possible_item.destroy
    end
  end
end
