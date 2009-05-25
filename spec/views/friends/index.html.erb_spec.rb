require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/friends/index.html.erb" do
  include FriendsHelper
  
  before(:each) do
    assigns[:friends] = [
      stub_model(Friend,
        :kind => "value for kind",
        :notes => "value for notes"
      ),
      stub_model(Friend,
        :kind => "value for kind",
        :notes => "value for notes"
      )
    ]
  end

  it "renders a list of friends" do
    render
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
  end
end

