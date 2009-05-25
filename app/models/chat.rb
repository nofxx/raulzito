class Chat < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
end

# == Schema Information
# Schema version: 20090525081807
#
# Table name: chats
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  match_id   :integer         not null
#  text       :string(255)
#  sent_at    :datetime
#  created_at :datetime
#  updated_at :datetime
#

