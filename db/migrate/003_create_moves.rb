class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.references :match
      t.integer :order
      #example a2, b8 - note for 8x8 board, a one byte uint could indicate
      # a to/from coordinate in far less space, but for now string rep is fine
      t.string :from_coord, :to_coord, :string, :limit => 10

      #a notation summary of the move
      t.string :notation,  :limit => 10

      #calculated but stored for ease of computation
      t.integer :castled

      #if the piece captured was not on the to_coord square as in en passant capture
      t.string :captured_piece_coord, :limit => 10, :default => nil

      #the piece promoted to
      t.string :promotion_choice, :limit => 1

      t.timestamps
    end

    add_index :moves, :match_id

  end

  def self.down
    drop_table :moves
  end
end
