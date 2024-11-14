class Movie < ApplicationRecord
  has_many :bookmarks
  validates_presence_of :title, :overview
  validates_uniqueness_of :title
end
