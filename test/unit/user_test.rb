require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should fill first and lastname from openid" do
    user = User.new
    #send est une technique d'introspection utile pour appeller une méthode privée
    user.send :map_openid_registration, {"fullname" => "Christian Blavier"}
    assert_equal "Christian", user.firstname
    assert_equal "Blavier", user.lastname
  end
  
  test "should generate username from first and lastname" do 
    user = User.new :firstname => "Christian", :lastname => "Blavier"
    user.send :generate_username
    assert_equal "cblavier", user.username
  end
  
  test "should fill first and lastname from openid with composite firstname" do
    user = User.new
    user.send :map_openid_registration, {"fullname" => "François Joseph Grimault"}
    assert_equal "François Joseph", user.firstname
    assert_equal "Grimault", user.lastname
  end
  
  test "should generate username from composite firstname and lastname" do 
    user = User.new :firstname => "François Joseph", :lastname => "Grimault"
    user.send :generate_username
    assert_equal "fjgrimault", user.username
  end
  
  test "should fill first and lastname from openid with composite firstname and minus" do
    user = User.new
    user.send :map_openid_registration, {"fullname" => "Marc-Antoine Garrigue"}
    assert_equal "Marc-Antoine", user.firstname
    assert_equal "Garrigue", user.lastname
  end
  
  test "should generate username from composite firstname with minus and lastname" do 
    user = User.new :firstname => "Marc-Antoine", :lastname => "Garrigue"
    user.send :generate_username
    assert_equal "magarrigue", user.username
  end

  test "should fail when nothing comes from openid" do
    user = User.new
    assert_raise RuntimeError do
      user.send :map_openid_registration, {"fullname" => nil}
    end
  end  
  
  test "should fail when when single word comes from openid" do
    user = User.new
    user.send :map_openid_registration, {"fullname" => "Bob"}
  end

end