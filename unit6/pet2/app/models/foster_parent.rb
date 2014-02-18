class FosterParent < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  validates :name, :address, :email, presence: true
  def add_line_items_from_foster(foster)
    foster.line_items.each do |item|
      item.foster_id = nil
      line_items << item
    end
  end
end