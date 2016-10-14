require "test_helper"

class DashboardControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end

# describe DashboardController do
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