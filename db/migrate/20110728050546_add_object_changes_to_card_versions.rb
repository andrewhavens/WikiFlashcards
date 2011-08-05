class AddObjectChangesToCardVersions < ActiveRecord::Migration
  def self.up
    add_column :card_versions, :object_changes, :text
  end

  def self.down
    remove_column :card_versions, :object_changes
  end
end
