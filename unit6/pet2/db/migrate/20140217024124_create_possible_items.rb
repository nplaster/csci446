class CreatePossibleItems < ActiveRecord::Migration
  def change
    create_table :possible_items do |t|
      t.references :animal, index: true
      t.belongs_to :consider, index: true

      t.timestamps
    end
  end
end
