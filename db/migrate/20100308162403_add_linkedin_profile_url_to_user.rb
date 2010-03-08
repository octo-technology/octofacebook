class AddLinkedinProfileUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :linkedin_profile_url, :string
  end

  def self.down
    remove_column :users, :linkedin_profile_url
  end
end
