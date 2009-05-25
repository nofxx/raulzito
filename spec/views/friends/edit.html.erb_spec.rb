require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/friends/edit.html.erb" do
  include FriendsHelper
  
  before(:each) do
    assigns[:friend] = @friend = stub_model(Friend,
      :new_record? => false,
      :kind => "value for kind",
      :notes => "value for notes"
    )
  end

  it "renders the edit friend form" do
    render
    
    response.should have_tag("form[action=#{friend_path(@friend)}][method=post]") do
      with_tag('input#friend_kind[name=?]', "friend[kind]")
      with_tag('textarea#friend_notes[name=?]', "friend[notes]")
    end
  end
end


