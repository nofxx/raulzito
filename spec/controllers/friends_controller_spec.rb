require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FriendsController do

  def mock_friend(stubs={})
    @mock_friend ||= mock_model(Friend, stubs)
  end
  
  describe "GET index" do
    it "assigns all friends as @friends" do
      Friend.stub!(:find).with(:all).and_return([mock_friend])
      get :index
      assigns[:friends].should == [mock_friend]
    end
  end

  describe "GET show" do
    it "assigns the requested friend as @friend" do
      Friend.stub!(:find).with("37").and_return(mock_friend)
      get :show, :id => "37"
      assigns[:friend].should equal(mock_friend)
    end
  end

  describe "GET new" do
    it "assigns a new friend as @friend" do
      Friend.stub!(:new).and_return(mock_friend)
      get :new
      assigns[:friend].should equal(mock_friend)
    end
  end

  describe "GET edit" do
    it "assigns the requested friend as @friend" do
      Friend.stub!(:find).with("37").and_return(mock_friend)
      get :edit, :id => "37"
      assigns[:friend].should equal(mock_friend)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created friend as @friend" do
        Friend.stub!(:new).with({'these' => 'params'}).and_return(mock_friend(:save => true))
        post :create, :friend => {:these => 'params'}
        assigns[:friend].should equal(mock_friend)
      end

      it "redirects to the created friend" do
        Friend.stub!(:new).and_return(mock_friend(:save => true))
        post :create, :friend => {}
        response.should redirect_to(friend_url(mock_friend))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved friend as @friend" do
        Friend.stub!(:new).with({'these' => 'params'}).and_return(mock_friend(:save => false))
        post :create, :friend => {:these => 'params'}
        assigns[:friend].should equal(mock_friend)
      end

      it "re-renders the 'new' template" do
        Friend.stub!(:new).and_return(mock_friend(:save => false))
        post :create, :friend => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested friend" do
        Friend.should_receive(:find).with("37").and_return(mock_friend)
        mock_friend.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :friend => {:these => 'params'}
      end

      it "assigns the requested friend as @friend" do
        Friend.stub!(:find).and_return(mock_friend(:update_attributes => true))
        put :update, :id => "1"
        assigns[:friend].should equal(mock_friend)
      end

      it "redirects to the friend" do
        Friend.stub!(:find).and_return(mock_friend(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(friend_url(mock_friend))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested friend" do
        Friend.should_receive(:find).with("37").and_return(mock_friend)
        mock_friend.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :friend => {:these => 'params'}
      end

      it "assigns the friend as @friend" do
        Friend.stub!(:find).and_return(mock_friend(:update_attributes => false))
        put :update, :id => "1"
        assigns[:friend].should equal(mock_friend)
      end

      it "re-renders the 'edit' template" do
        Friend.stub!(:find).and_return(mock_friend(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested friend" do
      Friend.should_receive(:find).with("37").and_return(mock_friend)
      mock_friend.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the friends list" do
      Friend.stub!(:find).and_return(mock_friend(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(friends_url)
    end
  end

end
