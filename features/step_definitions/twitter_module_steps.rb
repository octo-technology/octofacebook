require "mocha"

Given /^I have twitted "([^\"]*)"$/ do |twitt|
  #Configuration d'un mock pour que le client Twitter retourne le texte passé ici
  TwitterProxy.any_instance.
    stubs(:get_last_twitts_for_user).
    returns([Mash.new(:text => twitt)])
end

