Given /^I have twitted "([^\"]*)"$/ do |twitt|
  #Configuration d'un mock pour que le client Twitter retourne le texte passé ici
  TwitterProxy.any_instance.expects(:get_last_twitts_for_user).returns([OpenStruct.new(:text => twitt)])
end
