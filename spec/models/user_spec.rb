require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  it "should create a new instance given valid attributes" do
    User.generate.should be_valid
  end
end
