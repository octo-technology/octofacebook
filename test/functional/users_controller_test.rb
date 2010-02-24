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

  test "should show user with twitts" do
    u = Factory(:user, :username => "bob", :twitter_identifier => "bob")
    
    #On crée un mock de TwitterProxy qui renvoie ce twitt
    twitt = OpenStruct.new :text => "Hello this is my twitt"
    TwitterProxy.any_instance.expects(:get_last_twitts_for_user).returns([twitt])

    #On vérifie que le twitt est bien présent dans le tableau de twitt passé à la page
    get :show, :username => "bob"
    assert_response :success
    assert assigns(:twitts).include?(twitt)
  end

  test "should show user with one blog post" do
  u = Factory(:user, :username => "bob", :blog_feed_url => "http://blog.octo.com/author/bob/feed")
  FakeWeb.register_uri(:get, "http://blog.octo.com/author/bob/feed", 
    :body => "<rss><channel> 
    	<item> 
    		<title>Wouhou</title> 
    		<link>http://blog.octo.com/wouhou</link> 
    		<description>ipsum loret</description>
    	</item>
    </channel></rss>")
    
    get :show, :username => "bob"
    assert_response :success
    assert assigns(:blog_posts).include?({:title => "Wouhou", :link => "http://blog.octo.com/wouhou", :content => "ipsum loret"})
  end

  test "should get edit page" do
    u = Factory(:user, :username => "bob")
    get :edit, :username => "bob"
    assert_response :success
  end

  test "should update user with prenom Christophe" do
    u = Factory(:user, :username => "cblavier", :firstname => "Christian")
    put :update, :username => "cblavier", :user => { :firstname => "Christophe" }
    assert_redirected_to public_page_path("cblavier")
    assert assigns(:user).firstname == "Christophe"
  end

end

