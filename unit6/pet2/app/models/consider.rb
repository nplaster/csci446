class Consider < ActiveRecord::Base
  has_many :possible_items, dependent: :destroy
end
