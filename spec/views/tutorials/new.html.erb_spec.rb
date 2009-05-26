require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tutorials/new.html.erb" do
  include TutorialsHelper
  
  before(:each) do
    assigns[:tutorial] = stub_model(Tutorial,
      :new_record? => true,
      :name => "value for name",
      :move_queue => "value for move_queue",
      :body => "value for body"
    )
  end

  it "renders new tutorial form" do
    render
    
    response.should have_tag("form[action=?][method=post]", tutorials_path) do
      with_tag("input#tutorial_name[name=?]", "tutorial[name]")
      with_tag("textarea#tutorial_move_queue[name=?]", "tutorial[move_queue]")
      with_tag("textarea#tutorial_body[name=?]", "tutorial[body]")
    end
  end
end


