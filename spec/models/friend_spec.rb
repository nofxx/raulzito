require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Friend do
  before(:each) do
    @valid_attributes = {
      :kind => "value for kind",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    Friend.create!(@valid_attributes)
  end
end
