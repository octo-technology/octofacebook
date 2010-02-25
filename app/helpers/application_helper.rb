# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def gravatar(user)
    image_tag( "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.username + "@octo.com")}")
  end
end
