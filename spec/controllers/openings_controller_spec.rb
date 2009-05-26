require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OpeningsController do

  def mock_opening(stubs={})
    @mock_opening ||= mock_model(Opening, stubs)
  end
  
  describe "GET index" do
    it "assigns all openings as @openings" do
      Opening.stub!(:find).with(:all).and_return([mock_opening])
      get :index
      assigns[:openings].should == [mock_opening]
    end
  end

  describe "GET show" do
    it "assigns the requested opening as @opening" do
      Opening.stub!(:find).with("37").and_return(mock_opening)
      get :show, :id => "37"
      assigns[:opening].should equal(mock_opening)
    end
  end

  describe "GET new" do
    it "assigns a new opening as @opening" do
      Opening.stub!(:new).and_return(mock_opening)
      get :new
      assigns[:opening].should equal(mock_opening)
    end
  end

  describe "GET edit" do
    it "assigns the requested opening as @opening" do
      Opening.stub!(:find).with("37").and_return(mock_opening)
      get :edit, :id => "37"
      assigns[:opening].should equal(mock_opening)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created opening as @opening" do
        Opening.stub!(:new).with({'these' => 'params'}).and_return(mock_opening(:save => true))
        post :create, :opening => {:these => 'params'}
        assigns[:opening].should equal(mock_opening)
      end

      it "redirects to the created opening" do
        Opening.stub!(:new).and_return(mock_opening(:save => true))
        post :create, :opening => {}
        response.should redirect_to(opening_url(mock_opening))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved opening as @opening" do
        Opening.stub!(:new).with({'these' => 'params'}).and_return(mock_opening(:save => false))
        post :create, :opening => {:these => 'params'}
        assigns[:opening].should equal(mock_opening)
      end

      it "re-renders the 'new' template" do
        Opening.stub!(:new).and_return(mock_opening(:save => false))
        post :create, :opening => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested opening" do
        Opening.should_receive(:find).with("37").and_return(mock_opening)
        mock_opening.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :opening => {:these => 'params'}
      end

      it "assigns the requested opening as @opening" do
        Opening.stub!(:find).and_return(mock_opening(:update_attributes => true))
        put :update, :id => "1"
        assigns[:opening].should equal(mock_opening)
      end

      it "redirects to the opening" do
        Opening.stub!(:find).and_return(mock_opening(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(opening_url(mock_opening))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested opening" do
        Opening.should_receive(:find).with("37").and_return(mock_opening)
        mock_opening.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :opening => {:these => 'params'}
      end

      it "assigns the opening as @opening" do
        Opening.stub!(:find).and_return(mock_opening(:update_attributes => false))
        put :update, :id => "1"
        assigns[:opening].should equal(mock_opening)
      end

      it "re-renders the 'edit' template" do
        Opening.stub!(:find).and_return(mock_opening(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested opening" do
      Opening.should_receive(:find).with("37").and_return(mock_opening)
      mock_opening.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the openings list" do
      Opening.stub!(:find).and_return(mock_opening(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(openings_url)
    end
  end

end
