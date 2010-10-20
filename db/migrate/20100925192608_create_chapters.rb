class CreateChapters < ActiveRecord::Migration
  def self.up
    create_table :chapters do |t|
      t.string :title
      t.integer :display_rank
      t.references :book

      t.timestamps
    end
  end

  def self.down
    drop_table :chapters
  end
end
