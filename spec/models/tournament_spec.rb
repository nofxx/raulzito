require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Tournament do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :kind => "value for kind",
      :start_at => Time.now,
      :end_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Tournament.create!(@valid_attributes)
  end
end
