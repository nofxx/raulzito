require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tournaments/new.html.erb" do
  include TournamentsHelper
  
  before(:each) do
    assigns[:tournament] = stub_model(Tournament,
      :new_record? => true,
      :name => "value for name",
      :kind => "value for kind"
    )
  end

  it "renders new tournament form" do
    render
    
    response.should have_tag("form[action=?][method=post]", tournaments_path) do
      with_tag("input#tournament_name[name=?]", "tournament[name]")
      with_tag("input#tournament_kind[name=?]", "tournament[kind]")
    end
  end
end


