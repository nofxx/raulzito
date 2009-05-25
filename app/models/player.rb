class Player < ActiveRecord::Base


  validates_length_of :name, :maximum => 20
  validates_uniqueness_of :name


  has_one    :user, :foreign_key => :playing_as
  # --OR--
  has_one    :fbuser, :foreign_key => :playing_as

  def facebook_id
    return nil unless fbuser
    fbuser.facebook_user_id
  end


end
