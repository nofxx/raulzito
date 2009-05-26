require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tournaments/show.html.erb" do
  include TournamentsHelper
  before(:each) do
    assigns[:tournament] = @tournament = stub_model(Tournament,
      :name => "value for name",
      :kind => "value for kind"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ kind/)
  end
end

