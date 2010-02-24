require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new page" do
    get :new
    assert_response :success
  end

  test "should create user" do
    User.any_instance.stubs(:valid?).returns(true)
    assert_difference('User.count') do
      post :create, 
      :user => {
        :username => "username",
        :openid_identifier => "openid",
        :firstname => "firstname",
        :lastname => "lastname"
      }
    end
    assert_redirected_to edit_page_path(:username)
  end
  
  test "should show user" do
    u = Factory(:user, :twitter_identifier => nil)
    get :show, :username => u.username
    assert_response :success
    assert_select "h1", u.fullname
  end

  test "should get edit page" do
    u = Factory(:user, :username => "bob")
    UsersController.any_instance.stubs(:current_user).returns(User.new(:username => 'bob'))
    get :edit, :username => "bob"
    assert_response :success
  end

  test "should update user with prenom Christophe" do
    u = Factory(:user, :username => "cblavier", :firstname => "Christian")
    UsersController.any_instance.stubs(:current_user).returns(User.new(:username => 'cblavier'))
    
    put :update, :username => "cblavier", :user => { :firstname => "Christophe" }
    assert_redirected_to public_page_path("cblavier")
    assert assigns(:user).firstname == "Christophe"
  end

end

