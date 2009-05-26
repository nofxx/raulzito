require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchesController do

  def mock_match(stubs = { })
    @mock_match ||= mock_model(Match, stubs)
  end

  describe "Logged in" do
    before(:each) do
      auth_login_as :admin
    end

    # TODO this will change if viewing a read-only match
    it "test_redirected_to_login_if_requesting_active_match" do
      Match.stub!(:find).with("8").and_return(mock_match)

      get :show, :id => "8"  #no player_id in session
      assigns[:match].should equal(mock_match) #response.should eql(302)
    end

    it "test_redirected_to_match_listing_page_when_resigning_match" do
      pending
      Match.stub!(:find).with("2").and_return(mock_match)
      @mock_match.should_receive(:resign).with(1).and_return true


      get :resign, { :id => "2"}, {:player_id => "1"}
      response.should redirect_to(matches_url) #assert_response 302
    end

    def test_white_view_of_board_when_requested_by_white
      pending
      get :show, { :id => matches(:paul_vs_dean).id }, {:player_id => players(:paul).id }
      assert_response 200
      assert_equal :white, assigns['viewed_from_side']

      #assert 8 is first in the list so when board rendered down page, 1 is at the bottom
      assert_equal '8', assigns['ranks'][0].chr
    end

    def test_black_view_of_board_when_requested_by_black
      pending
      get :show, { :id => matches(:paul_vs_dean).id }, {:player_id => players(:dean).id }

      assert_response 200
      assert_equal :black, assigns['viewed_from_side']

      assert_equal '1', assigns['ranks'][0].chr
    end

    def test_requesting_ended_match_yields_result_template
      pending
      get :show, { :id => matches(:resigned).id }, {:player_id => players(:dean).id }
      assert_response 200
      assert_template 'match/result'
    end

    def test_gets_form_for_creating_new_match
      pending
      get :new, nil, {:player_id => players(:dean).id }
      assert_response 200
      assert_template 'match/new'
    end

    def test_creates_new_match_opponent_as_black
      pending
      post :create, {:opponent_side => 2, :opponent_id => players(:paul).id}, {:player_id => players(:dean).id }
      assert_not_nil assigns['match']
      assert_response 302
    end

    def test_gets_match_status
      pending
      get :status, { :id => matches(:paul_vs_dean).id}, {:player_id => players(:paul).id }
      assert_response 200
    end

    def test_gets_list_of_active_matches
      pending
      get :index, nil, {:player_id => players(:paul).id }
      assert_equal [], assigns['matches'].find { |m| m.id == matches(:resigned).id }
      assert_response 200
    end

    def test_verifies_showing_a_match_renders_the_board
      pending
      get :show, { :id => 9 }, {:player_id => players(:dean).id }
      assert_response 200
      assert_select 'table#board_table'
    end

    #def test_can_undo_last_move_if_you_made_it
    #  assert_equal true, matches(:paul_vs_dean).turn_of?( players(:paul) )
    #  get :undo_last, { :match_id => matches(:paul_vs_dean).id } , {:player_id => players(:dean).id}
    #  assert_response :redirect #back to match
    #end
  end
end
