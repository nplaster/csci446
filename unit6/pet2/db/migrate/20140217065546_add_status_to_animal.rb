class AddStatusToAnimal < ActiveRecord::Migration
  def change
    add_reference :animals, :status, index: true
  end
end
