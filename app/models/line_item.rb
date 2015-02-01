class LineItem < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of :category_id, scope: :year
end
