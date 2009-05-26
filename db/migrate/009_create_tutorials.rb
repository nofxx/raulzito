class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.string :name
      t.text :move_queue
      t.text :body

      t.timestamps
    end

    add_index :tutorials, :name
    add_index :tutorials, :created_at
  end

  def self.down
    drop_table :tutorials
  end
end
