class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :openid_identifier, :null => false
      t.string :username, :null => false
      t.string :lastname, :null => false
      t.string :firstname, :null => false
      t.string :twitter_identifier
      t.string :persistence_token

      #Champs inutiles a priori mais authlogic en a besoin
      t.string :crypted_password
      t.string :password_salt

      t.timestamps
    end
    add_index :users, :openid_identifier, :unique => true
    
  end

  def self.down
    drop_table :accounts
  end
end
