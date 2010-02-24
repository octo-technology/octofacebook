Feature: Add a blog component to my public page
  In order to share my blog posts to others through an octo public page
  As an anonymous octo
  I want to set my blog feed url and see my posts on my page

	Scenario: Set my blog feed url and see my posts
		Given my name is Christian Blavier 
		And I am on octofacebook
		And my public page, cblavier, already exist
		And I have blogged "Here is my post" on a blog whose feed url is "http://blog.octo.com/author/cbl/feed"
		When I go to edit my page
		And I fill in "Feed RSS Octo Talks" with "http://blog.octo.com/author/cbl/feed"
		And I press "Valider"
		Then I should see "Christian Blavier"
		And I should see "Here is my post"
		