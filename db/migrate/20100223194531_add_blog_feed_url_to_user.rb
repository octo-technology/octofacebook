class AddBlogFeedUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :blog_feed_url, :string
  end

  def self.down
    remove_column :users, :blog_feed_url
  end
end
