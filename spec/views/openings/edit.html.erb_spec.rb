require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/openings/edit.html.erb" do
  include OpeningsHelper
  
  before(:each) do
    assigns[:opening] = @opening = stub_model(Opening,
      :new_record? => false,
      :name => "value for name",
      :move_queue => "value for move_queue"
    )
  end

  it "renders the edit opening form" do
    render
    
    response.should have_tag("form[action=#{opening_path(@opening)}][method=post]") do
      with_tag('input#opening_name[name=?]', "opening[name]")
      with_tag('textarea#opening_move_queue[name=?]', "opening[move_queue]")
    end
  end
end


