require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TutorialsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "tutorials", :action => "index").should == "/tutorials"
    end
  
    it "maps #new" do
      route_for(:controller => "tutorials", :action => "new").should == "/tutorials/new"
    end
  
    it "maps #show" do
      route_for(:controller => "tutorials", :action => "show", :id => "1").should == "/tutorials/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "tutorials", :action => "edit", :id => "1").should == "/tutorials/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "tutorials", :action => "create").should == {:path => "/tutorials", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "tutorials", :action => "update", :id => "1").should == {:path =>"/tutorials/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "tutorials", :action => "destroy", :id => "1").should == {:path =>"/tutorials/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/tutorials").should == {:controller => "tutorials", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/tutorials/new").should == {:controller => "tutorials", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/tutorials").should == {:controller => "tutorials", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/tutorials/1").should == {:controller => "tutorials", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/tutorials/1/edit").should == {:controller => "tutorials", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/tutorials/1").should == {:controller => "tutorials", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/tutorials/1").should == {:controller => "tutorials", :action => "destroy", :id => "1"}
    end
  end
end
