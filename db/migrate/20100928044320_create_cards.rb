class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.string :side1
      t.string :side2
      t.references :chapter

      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
