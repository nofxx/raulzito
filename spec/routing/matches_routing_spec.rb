require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "matches", :action => "index").should == "/matches"
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/matches").should == {:controller => "matches", :action => "index"}
    end
  end
end
