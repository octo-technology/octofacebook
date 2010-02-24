Feature: Create my public page
  In order to have my public page online
  As an anonymous octo
  I want to create my page and see it online

	Scenario: Create my page
		Given I am on octofacebook
		And openid server is available and provides my fullname "Francois Hisquin"
		When I follow "Cree ta page OctoFaceBook"
		And I fill in "OpenID" with "https://openid.octo.com/users/fhi"
		And I press "Valider"
		And I press "Valider"
		Then I should be on fhisquin's public page 
		And I should see "Francois Hisquin"

	Scenario: Create my page with an existing account
		Given a user exists
		And I am on octofacebook
		When I follow "Cree ta page OctoFaceBook"
		And I fill in "OpenID" with "https://openid.octo.com/users/fhi"
		And I press "Valider"
		Then I should see "Une erreur"
  
	Scenario: Editing my page when not logged in
		Given a user exists
		And I am on octofacebook
		Then I should not see "Editer ma page"
	
	Scenario: Editing my page when not logged in
		Given a user exists
		And I am on octofacebook
		And I go to fhisquin's edit page
		Then I should see "Tu n'as pas les droits canaillou"
 
	Scenario: Editing my page when logged in
		Given a user exists and I am logged in as this user
		And I am on octofacebook
		Then I should see "Editer ma page"
	
    