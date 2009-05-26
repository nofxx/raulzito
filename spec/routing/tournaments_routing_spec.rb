require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TournamentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "tournaments", :action => "index").should == "/tournaments"
    end
  
    it "maps #new" do
      route_for(:controller => "tournaments", :action => "new").should == "/tournaments/new"
    end
  
    it "maps #show" do
      route_for(:controller => "tournaments", :action => "show", :id => "1").should == "/tournaments/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "tournaments", :action => "edit", :id => "1").should == "/tournaments/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "tournaments", :action => "create").should == {:path => "/tournaments", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "tournaments", :action => "update", :id => "1").should == {:path =>"/tournaments/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "tournaments", :action => "destroy", :id => "1").should == {:path =>"/tournaments/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/tournaments").should == {:controller => "tournaments", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/tournaments/new").should == {:controller => "tournaments", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/tournaments").should == {:controller => "tournaments", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/tournaments/1").should == {:controller => "tournaments", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/tournaments/1/edit").should == {:controller => "tournaments", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/tournaments/1").should == {:controller => "tournaments", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/tournaments/1").should == {:controller => "tournaments", :action => "destroy", :id => "1"}
    end
  end
end
