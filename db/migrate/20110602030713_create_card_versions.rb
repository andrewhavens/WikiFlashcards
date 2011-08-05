class CreateCardVersions < ActiveRecord::Migration
  def self.up
    create_table :card_versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
      t.integer  :book_id
      t.integer  :chapter_id
    end
    add_index :card_versions, [:item_type, :item_id]
  end

  def self.down
    remove_index :card_versions, [:item_type, :item_id]
    drop_table :card_versions
  end
end
