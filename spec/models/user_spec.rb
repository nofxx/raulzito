require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

  it "should create a new instance given valid attributes" do
    User.generate.should be_valid
  end

  describe "Valid One" do
    before(:each) do
      @user = User.generate
    end

    it "should create a player" do
      @user.player.name.should eql(@user.login)
    end

    it "should respond to playing as" do
      @user.playing_as.should eql(@user.player)
    end
  end

end
