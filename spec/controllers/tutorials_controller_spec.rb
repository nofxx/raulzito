require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TutorialsController do

  def mock_tutorial(stubs={})
    @mock_tutorial ||= mock_model(Tutorial, stubs)
  end
  
  describe "GET index" do
    it "assigns all tutorials as @tutorials" do
      Tutorial.stub!(:find).with(:all).and_return([mock_tutorial])
      get :index
      assigns[:tutorials].should == [mock_tutorial]
    end
  end

  describe "GET show" do
    it "assigns the requested tutorial as @tutorial" do
      Tutorial.stub!(:find).with("37").and_return(mock_tutorial)
      get :show, :id => "37"
      assigns[:tutorial].should equal(mock_tutorial)
    end
  end

  describe "GET new" do
    it "assigns a new tutorial as @tutorial" do
      Tutorial.stub!(:new).and_return(mock_tutorial)
      get :new
      assigns[:tutorial].should equal(mock_tutorial)
    end
  end

  describe "GET edit" do
    it "assigns the requested tutorial as @tutorial" do
      Tutorial.stub!(:find).with("37").and_return(mock_tutorial)
      get :edit, :id => "37"
      assigns[:tutorial].should equal(mock_tutorial)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created tutorial as @tutorial" do
        Tutorial.stub!(:new).with({'these' => 'params'}).and_return(mock_tutorial(:save => true))
        post :create, :tutorial => {:these => 'params'}
        assigns[:tutorial].should equal(mock_tutorial)
      end

      it "redirects to the created tutorial" do
        Tutorial.stub!(:new).and_return(mock_tutorial(:save => true))
        post :create, :tutorial => {}
        response.should redirect_to(tutorial_url(mock_tutorial))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved tutorial as @tutorial" do
        Tutorial.stub!(:new).with({'these' => 'params'}).and_return(mock_tutorial(:save => false))
        post :create, :tutorial => {:these => 'params'}
        assigns[:tutorial].should equal(mock_tutorial)
      end

      it "re-renders the 'new' template" do
        Tutorial.stub!(:new).and_return(mock_tutorial(:save => false))
        post :create, :tutorial => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested tutorial" do
        Tutorial.should_receive(:find).with("37").and_return(mock_tutorial)
        mock_tutorial.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tutorial => {:these => 'params'}
      end

      it "assigns the requested tutorial as @tutorial" do
        Tutorial.stub!(:find).and_return(mock_tutorial(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tutorial].should equal(mock_tutorial)
      end

      it "redirects to the tutorial" do
        Tutorial.stub!(:find).and_return(mock_tutorial(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tutorial_url(mock_tutorial))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested tutorial" do
        Tutorial.should_receive(:find).with("37").and_return(mock_tutorial)
        mock_tutorial.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tutorial => {:these => 'params'}
      end

      it "assigns the tutorial as @tutorial" do
        Tutorial.stub!(:find).and_return(mock_tutorial(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tutorial].should equal(mock_tutorial)
      end

      it "re-renders the 'edit' template" do
        Tutorial.stub!(:find).and_return(mock_tutorial(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested tutorial" do
      Tutorial.should_receive(:find).with("37").and_return(mock_tutorial)
      mock_tutorial.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the tutorials list" do
      Tutorial.stub!(:find).and_return(mock_tutorial(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tutorials_url)
    end
  end

end
