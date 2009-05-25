# The participation of a player in a given match
class Gameplay < ActiveRecord::Base
  belongs_to :user
  belongs_to :match

  def move_queue
    @move_queue ||= MoveQueue.new( self[:move_queue] )
  end
  def move_queue= q
    @move_queue = q
    self[:move_queue] = q.to_s
  end

end

# == Schema Information
# Schema version: 20090525081807
#
# Table name: gameplays
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  match_id   :integer         not null
#  black      :boolean
#  move_queue :string(20)
#  created_at :datetime
#  updated_at :datetime
#

