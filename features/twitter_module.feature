Feature: Add a twitter component to my public page
  In order to share my twits to others through an octo public page
  As an anonymous octo
  I want to set my twitter account and see my twitts on my page

	Scenario: Set my twitter account and see my twitts
		Given my name is Christian Blavier 
		And I am on octofacebook
		And my public page, cblavier, already exist
		And I have twitted "Here is my twitt"
		When I go to edit my page
		And I fill in "Compte Twitter" with "cblavier"
		And I press "Valider"
		Then I should see "Bienvenue sur la page publique de Christian"
		And I should see "Here is my twitt"
		