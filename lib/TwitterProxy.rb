class TwitterProxy

  def get_last_twitts_for_user username
    Twitter::Search.new.from(username).per_page(5)
  end
  
end