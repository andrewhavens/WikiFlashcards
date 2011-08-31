class CreateMyBooks < ActiveRecord::Migration
  def self.up
    create_table :my_books do |t|
      t.references :user
      t.references :book

      t.timestamps
    end
  end

  def self.down
    drop_table :my_books
  end
end
