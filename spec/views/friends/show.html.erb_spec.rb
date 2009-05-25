require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/friends/show.html.erb" do
  include FriendsHelper
  before(:each) do
    assigns[:friend] = @friend = stub_model(Friend,
      :kind => "value for kind",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ notes/)
  end
end

