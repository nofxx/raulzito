class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.references :winner
      t.string :name, :null => false
      t.string :kind
      t.timestamp :start_at
      t.timestamp :end_at

      t.timestamps
    end

    create_table :subscriptions do |t|
      t.references :tournament, :player
      t.integer :rank

      t.timestamps
    end

    add_index :tournaments, :name
    add_index :tournaments, :winner_id
    add_index :tournaments, :kind
    add_index :tournaments, :start_at

    add_index :subscriptions, [:tournament_id, :player_id]
    add_index :subscriptions, :tournament_id
    add_index :subscriptions, :player_id
    add_index :subscriptions, :rank
  end

  def self.down
    drop_table :tournaments
  end
end
