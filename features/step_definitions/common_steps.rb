Given /^my name is ([a-zA-Z]+) ([a-zA-Z]+)$/ do |firstname, lastname|
  #On garde les nom et prénom pour les utiliser plus tard 
  @firstname = firstname
  @lastname = lastname
end

Given /^my public page, (.+), already exist$/ do |username|
  #On garde le username de côté pour l'utiliser dans paths.rb
  @username = username
  #On crée un compte avec le username, le nom et le prenom
  User.create(
    :username => username,
    :firstname => @firstname,
    :lastname => @lastname,
    :openid_identifier => "https://openid.octo.com/users/cbl")
end

Given /^openid server is available and provides my fullname "([^\"]*)"$/ do |$fullname|
  ActionController::Base.class_eval do
    private
      def begin_open_id_authentication(identity_url, options = {})
          yield OpenIdAuthentication::Result.new(:successful), identity_url, {"fullname" => $fullname}
    end
  end
end