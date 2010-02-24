
Given /^I have blogged "([^\"]*)" on a blog whose feed url is "([^\"]*)"$/ do |post, feed_url|
  FakeWeb.register_uri(:get, feed_url, 
    :body => "<rss><channel> 
    	<item> 
    		<title>#{post}</title> 
    		<link>http://blog.octo.com/wouhou</link> 
    		<description>ipsum loret</description>
    	</item>
    </channel></rss>")
end