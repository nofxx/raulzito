class CreateChats < ActiveRecord::Migration
  def self.up
    create_table :chats do |t|
      t.references :player, :match, :null => false
      t.string :text
      t.timestamp :sent_at

      t.timestamps
    end

    add_index :chats, :player_id
    add_index :chats, :match_id
    add_index :chats, :sent_at
  end

  def self.down
    drop_table :chats
  end
end
