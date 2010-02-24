Feature: Add a blog component to my public page
  In order to share my blog posts to others through an octo public page
  As an anonymous octo
  I want to set my blog feed url and see my posts on my page

	Scenario: Set my blog feed url and see my posts
		Given a user exists and I am logged in as this user
		Given I have posted this on blog whose feed url is "http://blog.octo.com/author/cbl/feed"
		  | title		  | content         | link								|
		  | Hello World ! | Here is my post | http://blog.octo.com/hello-world  |
		  | Another post  | blah blah       | http://blog.octo.com/another-post |
		  | Finally 	  | bleh bleh bleh  | http://blog.octo.com/finally		|
		When I go to edit my page
		And I fill in "Feed RSS Octo Talks" with "http://blog.octo.com/author/cbl/feed"
		And I press "Valider"
		Then I should see a link to "http://blog.octo.com/hello-world" with text "Hello World !"
		And I should see a link to "http://blog.octo.com/another-post" with text "Another post"
		And I should see a link to "http://blog.octo.com/finally" with text "Finally"
		
