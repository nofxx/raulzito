require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FriendsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "friends", :action => "index").should == "/friends"
    end
  
    it "maps #new" do
      route_for(:controller => "friends", :action => "new").should == "/friends/new"
    end
  
    it "maps #show" do
      route_for(:controller => "friends", :action => "show", :id => "1").should == "/friends/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "friends", :action => "edit", :id => "1").should == "/friends/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "friends", :action => "create").should == {:path => "/friends", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "friends", :action => "update", :id => "1").should == {:path =>"/friends/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "friends", :action => "destroy", :id => "1").should == {:path =>"/friends/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/friends").should == {:controller => "friends", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/friends/new").should == {:controller => "friends", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/friends").should == {:controller => "friends", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/friends/1").should == {:controller => "friends", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/friends/1/edit").should == {:controller => "friends", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/friends/1").should == {:controller => "friends", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/friends/1").should == {:controller => "friends", :action => "destroy", :id => "1"}
    end
  end
end
