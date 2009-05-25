class Player < ActiveRecord::Base
  generator_for :name, :method => :next_name

  def self.next_name
     @next_name ||= "dummons"
     @next_name = @next_name.succ
  end

end
