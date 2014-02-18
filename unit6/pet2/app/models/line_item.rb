class LineItem < ActiveRecord::Base
  belongs_to :foster_parent
  belongs_to :animal
  belongs_to :foster
end
