class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :winner, :loser
      t.string :name
      t.boolean :active#, :null => false, :default => true

      #an initial coordinate set in fen notation, if not the start of game
      t.string :start_pos, :limit => 100
      t.string :result, :limit => 10

      t.timestamps
    end

    add_index :matches, :winner_id
    add_index :matches, :active
  end

  def self.down
    drop_table :matches
  end
end
