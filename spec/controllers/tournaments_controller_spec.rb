require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TournamentsController do

  def mock_tournament(stubs={})
    @mock_tournament ||= mock_model(Tournament, stubs)
  end
  
  describe "GET index" do
    it "assigns all tournaments as @tournaments" do
      Tournament.stub!(:find).with(:all).and_return([mock_tournament])
      get :index
      assigns[:tournaments].should == [mock_tournament]
    end
  end

  describe "GET show" do
    it "assigns the requested tournament as @tournament" do
      Tournament.stub!(:find).with("37").and_return(mock_tournament)
      get :show, :id => "37"
      assigns[:tournament].should equal(mock_tournament)
    end
  end

  describe "GET new" do
    it "assigns a new tournament as @tournament" do
      Tournament.stub!(:new).and_return(mock_tournament)
      get :new
      assigns[:tournament].should equal(mock_tournament)
    end
  end

  describe "GET edit" do
    it "assigns the requested tournament as @tournament" do
      Tournament.stub!(:find).with("37").and_return(mock_tournament)
      get :edit, :id => "37"
      assigns[:tournament].should equal(mock_tournament)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created tournament as @tournament" do
        Tournament.stub!(:new).with({'these' => 'params'}).and_return(mock_tournament(:save => true))
        post :create, :tournament => {:these => 'params'}
        assigns[:tournament].should equal(mock_tournament)
      end

      it "redirects to the created tournament" do
        Tournament.stub!(:new).and_return(mock_tournament(:save => true))
        post :create, :tournament => {}
        response.should redirect_to(tournament_url(mock_tournament))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved tournament as @tournament" do
        Tournament.stub!(:new).with({'these' => 'params'}).and_return(mock_tournament(:save => false))
        post :create, :tournament => {:these => 'params'}
        assigns[:tournament].should equal(mock_tournament)
      end

      it "re-renders the 'new' template" do
        Tournament.stub!(:new).and_return(mock_tournament(:save => false))
        post :create, :tournament => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested tournament" do
        Tournament.should_receive(:find).with("37").and_return(mock_tournament)
        mock_tournament.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tournament => {:these => 'params'}
      end

      it "assigns the requested tournament as @tournament" do
        Tournament.stub!(:find).and_return(mock_tournament(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tournament].should equal(mock_tournament)
      end

      it "redirects to the tournament" do
        Tournament.stub!(:find).and_return(mock_tournament(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tournament_url(mock_tournament))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested tournament" do
        Tournament.should_receive(:find).with("37").and_return(mock_tournament)
        mock_tournament.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tournament => {:these => 'params'}
      end

      it "assigns the tournament as @tournament" do
        Tournament.stub!(:find).and_return(mock_tournament(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tournament].should equal(mock_tournament)
      end

      it "re-renders the 'edit' template" do
        Tournament.stub!(:find).and_return(mock_tournament(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested tournament" do
      Tournament.should_receive(:find).with("37").and_return(mock_tournament)
      mock_tournament.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the tournaments list" do
      Tournament.stub!(:find).and_return(mock_tournament(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tournaments_url)
    end
  end

end
