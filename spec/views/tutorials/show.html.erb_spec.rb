require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tutorials/show.html.erb" do
  include TutorialsHelper
  before(:each) do
    assigns[:tutorial] = @tutorial = stub_model(Tutorial,
      :name => "value for name",
      :move_queue => "value for move_queue",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ move_queue/)
    response.should have_text(/value\ for\ body/)
  end
end

