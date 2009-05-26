require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tutorials/edit.html.erb" do
  include TutorialsHelper
  
  before(:each) do
    assigns[:tutorial] = @tutorial = stub_model(Tutorial,
      :new_record? => false,
      :name => "value for name",
      :move_queue => "value for move_queue",
      :body => "value for body"
    )
  end

  it "renders the edit tutorial form" do
    render
    
    response.should have_tag("form[action=#{tutorial_path(@tutorial)}][method=post]") do
      with_tag('input#tutorial_name[name=?]', "tutorial[name]")
      with_tag('textarea#tutorial_move_queue[name=?]', "tutorial[move_queue]")
      with_tag('textarea#tutorial_body[name=?]', "tutorial[body]")
    end
  end
end


