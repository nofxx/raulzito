require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Opening do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :move_queue => "value for move_queue"
    }
  end

  it "should create a new instance given valid attributes" do
    Opening.create!(@valid_attributes)
  end
end
