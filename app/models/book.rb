class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_numericality_of :isbn10, :allow_blank => true
  validates_numericality_of :isbn13, :allow_blank => true
  validates_length_of :isbn10, :is => 10, :allow_blank => true
  validates_length_of :isbn13, :is => 13, :allow_blank => true
  has_many :chapters
  has_attached_file :cover,
                    :styles => { :medium => "100x125#",
                                 :small => "80x100#" },
                    :default_url => 'default_:style_book_cover.png'
  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
