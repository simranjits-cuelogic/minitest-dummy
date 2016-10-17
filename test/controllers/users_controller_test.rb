require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test 'shoud have default name' do
    get :new
    assert_response :success
    assert_equal "Dummy", assigns(:user).name
  end

# test for create action
  test 'shoud create user' do
    assert_difference("User.count", 1) do
      post :create, user: {name: @user.name, email: @user.email}

      # uncomment it to fail case -- name have presence validation
      # post :create, user: {name: '', email: @user.email}
    end

    # test for valid redirection
    assert_redirected_to user_path(assigns(:user))
  end

  test "shoud destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
      assert_redirected_to users_path
    end
  end

  test "shoud show user" do
    get :show, id: @user
    # test response of action.
    # assert_response :success

    # test assignment is took place or not.
    assert_not_nil assigns(:users)

    # test redirected to correct url.
    assert_redirected_to new_user_path
  end
end

# Spec way to write cases

# describe UsersController do
#   setup do
#     @user = users(:one)
#   end
#   context 'delete action' do
#     assert_difference('User.count', -1) do
#       delete :destroy, id: @user
#     end
#   end
# end

# describe UsersController do
#   context "index action" do
#     before do
#       # Make sure we are using the correct test class
#       self.class.ancestors.must_include ActionController::TestCase
#       # Continue with setup
#       get :index
#     end
#     it { must_respond_with :success }
#     it "must render index view" do
#       must_render_template :index
#     end
#   end
# end

# test 'API gives correct resopnse' do
#   stub("URL").to_return("test/test_data/file-success.json")

# end

# test 'API gives incorrect resopnse' do

# end