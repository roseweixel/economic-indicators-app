class Category < ActiveRecord::Base
  has_many :line_items
  validates_uniqueness_of :name
end
