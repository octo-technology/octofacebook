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

Given /^I have posted this on blog whose feed url is "([^\"]*)"$/ do |feed_url, posts_table|
  xml = Builder::XmlMarkup.new
  xml.rss {
    xml.channel {
      posts_table.hashes.each do |post| 
        xml.item {
          xml.title(post[:title])
          xml.description(post[:content])
          xml.link(post[:link])
        }
      end
    }
  }
  FakeWeb.register_uri(:get, feed_url, :body => xml.to_s)
end

