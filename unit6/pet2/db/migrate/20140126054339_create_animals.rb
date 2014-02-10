class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :age

      t.timestamps
    end
  end
end
