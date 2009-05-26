require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OpeningsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "openings", :action => "index").should == "/openings"
    end
  
    it "maps #new" do
      route_for(:controller => "openings", :action => "new").should == "/openings/new"
    end
  
    it "maps #show" do
      route_for(:controller => "openings", :action => "show", :id => "1").should == "/openings/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "openings", :action => "edit", :id => "1").should == "/openings/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "openings", :action => "create").should == {:path => "/openings", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "openings", :action => "update", :id => "1").should == {:path =>"/openings/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "openings", :action => "destroy", :id => "1").should == {:path =>"/openings/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/openings").should == {:controller => "openings", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/openings/new").should == {:controller => "openings", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/openings").should == {:controller => "openings", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/openings/1").should == {:controller => "openings", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/openings/1/edit").should == {:controller => "openings", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/openings/1").should == {:controller => "openings", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/openings/1").should == {:controller => "openings", :action => "destroy", :id => "1"}
    end
  end
end
