class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

end

# == Schema Information
# Schema version: 20090525081807
#
# Table name: friends
#
#  id         :integer         not null, primary key
#  kind       :string(255)
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

