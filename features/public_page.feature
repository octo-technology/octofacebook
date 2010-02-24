Feature: Create my public page
  In order to have my public page online
  As an anonymous octo
  I want to create my page and see it online

	Scenario: Create my page
		Given I am on octofacebook
		And openid server is available and provides my fullname "Francois Hisquin"
		When I follow "Crée ta page octofacebook"
		And I fill in "OpenID" with "https://openid.octo.com/users/fhi"
		And I press "Valider"
		And I press "Valider"
		Then I should be on fhisquin's public page 
		And I should see "Francois Hisquin"
		
	Scenario: Create my page with an existing account
		Given my name is Christian Blavier  
		And I am on octofacebook
		And my public page, cblavier, already exist
		When I follow "Crée ta page octofacebook"
		And I fill in "OpenID" with "https://openid.octo.com/users/cbl"
		And I press "Valider"
		Then I should see "error prohibited this user from being saved"
  
  Scenario: Listing available pages when not logged in
    Given a user exists
    And I am on octofacebook
    Then I should not see "Editer"
    
  Scenario: Listing available pages when logged in
    Given a user exists
    And I am logged in
    And I am on octofacebook
    Then I should see "Editer"
    