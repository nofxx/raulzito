class CreateOpenings < ActiveRecord::Migration
  def self.up
    create_table :openings do |t|
      t.string :name, :null => false
      t.text :move_queue, :null => false

      t.timestamps
    end

    add_index :openings, :name, :unique => true
    add_index :openings, :move_queue, :unique => true
  end

  def self.down
    drop_table :openings
  end
end
