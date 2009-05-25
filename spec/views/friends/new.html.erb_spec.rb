require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/friends/new.html.erb" do
  include FriendsHelper
  
  before(:each) do
    assigns[:friend] = stub_model(Friend,
      :new_record? => true,
      :kind => "value for kind",
      :notes => "value for notes"
    )
  end

  it "renders new friend form" do
    render
    
    response.should have_tag("form[action=?][method=post]", friends_path) do
      with_tag("input#friend_kind[name=?]", "friend[kind]")
      with_tag("textarea#friend_notes[name=?]", "friend[notes]")
    end
  end
end


