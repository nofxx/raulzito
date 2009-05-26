require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tutorials/index.html.erb" do
  include TutorialsHelper
  
  before(:each) do
    assigns[:tutorials] = [
      stub_model(Tutorial,
        :name => "value for name",
        :move_queue => "value for move_queue",
        :body => "value for body"
      ),
      stub_model(Tutorial,
        :name => "value for name",
        :move_queue => "value for move_queue",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of tutorials" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for move_queue".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

