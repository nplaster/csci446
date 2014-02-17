class Animal < ActiveRecord::Base
    has_many :possible_items
    has_many :line_items
    
    STATUS_TYPES = [ 0, 1 ]

  before_destroy :ensure_not_referenced_by_any_line_item
  before_destroy :ensure_not_referenced_by_any_possible_item
  #...

  validates :name, :description, :image_url, presence: true
  validates :age, numericality: {greater_than_or_equal_to: 0}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  def self.latest
    Animal.order(:updated_at).last
  end
  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
    
    def ensure_not_referenced_by_any_possible_item
      if possible_items.empty?
        return true
      else
        errors.add(:base, 'Possible Items present')
        return false
      end
    end
end
