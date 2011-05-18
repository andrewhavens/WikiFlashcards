class AddCardSideLabelsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :cards_side1, :string
    add_column :books, :cards_side2, :string
  end

  def self.down
    remove_column :books, :cards_side2
    remove_column :books, :cards_side1
  end
end
