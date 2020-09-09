class Book < ApplicationRecord
  has_many :copies
  validates :title, :presence => true
  validates :author, :presence => true
  validates :isbn, :presence => true
end
