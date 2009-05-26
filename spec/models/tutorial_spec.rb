require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tutorial do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :move_queue => "value for move_queue",
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Tutorial.create!(@valid_attributes)
  end
end
