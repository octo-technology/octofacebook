module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
    when /octofacebook/ 
      root_path
      
    when /edit my page/
      edit_page_path @username
       
    when /my public page/
      public_page_path @username
       
    when /^(.*)'s public page$/i
      public_page_path $1
      
    when /^(.*)'s edit page$/i
      edit_page_path $1

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
