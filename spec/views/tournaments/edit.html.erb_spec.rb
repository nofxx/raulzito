require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tournaments/edit.html.erb" do
  include TournamentsHelper
  
  before(:each) do
    assigns[:tournament] = @tournament = stub_model(Tournament,
      :new_record? => false,
      :name => "value for name",
      :kind => "value for kind"
    )
  end

  it "renders the edit tournament form" do
    render
    
    response.should have_tag("form[action=#{tournament_path(@tournament)}][method=post]") do
      with_tag('input#tournament_name[name=?]', "tournament[name]")
      with_tag('input#tournament_kind[name=?]', "tournament[kind]")
    end
  end
end


