class Card < ActiveRecord::Base
  belongs_to :chapter
  has_paper_trail :class_name => 'CardVersion',
                  :meta => { :book_id => Proc.new { |card| card.chapter.book_id },
                             :chapter_id => Proc.new { |card| card.chapter_id } }
end
