require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/openings/index.html.erb" do
  include OpeningsHelper
  
  before(:each) do
    assigns[:openings] = [
      stub_model(Opening,
        :name => "value for name",
        :move_queue => "value for move_queue"
      ),
      stub_model(Opening,
        :name => "value for name",
        :move_queue => "value for move_queue"
      )
    ]
  end

  it "renders a list of openings" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for move_queue".to_s, 2)
  end
end

