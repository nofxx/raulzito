require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Friend do

  it "should create a new instance given valid attributes" do
    Friend.generate.should be_valid
  end

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

