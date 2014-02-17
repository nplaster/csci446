class Consider < ActiveRecord::Base
  has_many :possible_items, dependent: :destroy

  def add_animal(animal_id)
    current_item = possible_items.find_by(animal_id: animal_id)
    if current_item
      current_item.quantity = 1
    else
      current_item = possible_items.build(animal_id: animal_id)
    end
    current_item
  end
end
