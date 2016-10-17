require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

describe User do
  setup do
    # @user = User.new(name: 'Valid Name') #treditional way
    # @user = users(:one) #using fixtures
    @user = build(:user) # Factory girl way
  end
  it 'should contain name' do
    assert @user.valid?, 'User is Invalid without all parameters.'
    assert_equal 'Valid Name', @user.name, 'Name is not as default value.'
    # assert User.new(name: 'f').valid?, 'The post was not valid when all parameters were supplied'
  end

  # test "User doesn't save without all parameters" do
  #   post = User.create(name: 'DummyName')
  #   assert_not post.valid?, 'User should not be valid when missing email'
  # end

end