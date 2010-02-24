Given /^openid server is available and provides my fullname "([^\"]*)"$/ do |$fullname|
  ActionController::Base.class_eval do
    private
      def begin_open_id_authentication(identity_url, options = {})
        yield OpenIdAuthentication::Result.new(:successful), identity_url, {"fullname" => $fullname}
    end
  end
end

Given /^a user exists$/ do
  Factory :user
end

Given /^a user exists and I am logged in as this user$/ do 
  u = Factory :user
  UsersController.any_instance.stubs(:current_user).returns(u)
  @username = u.username
end