class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_numericality_of :isbn10, :allow_blank => true
  validates_numericality_of :isbn13, :allow_blank => true
  validates_length_of :isbn10, :is => 10, :allow_blank => true
  validates_length_of :isbn13, :is => 13, :allow_blank => true
  has_many :chapters
end
