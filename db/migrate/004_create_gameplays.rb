class CreateGameplays < ActiveRecord::Migration
  def self.up
    create_table :gameplays do |t|
      t.references :player, :match, :null => false
      t.boolean :black, :default => false
      t.string  :move_queue, :limit => 20
      t.timestamps
    end

    add_index :gameplays, [:player_id, :match_id]
    add_index :gameplays, :player_id
  end

  def self.down
    drop_table :gameplays
  end
end
