require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tournaments/index.html.erb" do
  include TournamentsHelper
  
  before(:each) do
    assigns[:tournaments] = [
      stub_model(Tournament,
        :name => "value for name",
        :kind => "value for kind"
      ),
      stub_model(Tournament,
        :name => "value for name",
        :kind => "value for kind"
      )
    ]
  end

  it "renders a list of tournaments" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
  end
end

