require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/openings/show.html.erb" do
  include OpeningsHelper
  before(:each) do
    assigns[:opening] = @opening = stub_model(Opening,
      :name => "value for name",
      :move_queue => "value for move_queue"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ move_queue/)
  end
end

