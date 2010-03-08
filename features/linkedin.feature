Feature: Add a link to my Linked In profile to my public page
  In order to share my Linked In to others through an octo public page
  As an anonymous octo
  I want to set my Linked In public profile url and see the link to it on my page

	Scenario: Set my Linked In public profile url
	  Given a user exists and I am logged in as this user
	  When I go to edit my page
	  And I fill in "Profil Linked In" with "http://fr.linkedin.com/in/cblavier"
	  And I press "Valider"
	  Then I should see "Mon profil Linked In"

# Implémenter ce test
#	Scenario: Access a summary of my Linked In public profile
#	  Given a user exists and I am logged in as this user
#	  When I go to my public page
#	    And I follow "Mon profil Linked In"
#	  Then I should see ...