require 'test_helper'

class RoutingTest < ActionController::TestCase

  def test_user_routing
    #test de l'index 
    assert_routing(
      {:path => "/", :method => :get},
      {:controller => "users", :action => "index"}
    )
    
    #test de l'acces à la page publique
    assert_routing(
      {:path => "/username", :method => :get}, 
      {:controller => "users", :action => "show", :username => "username"}
    )
    
    #test des urls de mise à jour de page
    assert_routing(
      {:path => "/username/edit", :method => :get},
      {:controller => "users", :action => "edit", :username => "username"}
    )
    assert_routing(
      {:path => "/username/update", :method => :put},
      {:controller => "users", :action => "update", :username => "username"}
    )
    
    #test des urls de creation de page
    assert_routing(
      {:path => "/new_user", :method => :get},
      {:controller => "users", :action => "new"}
    )
    assert_routing(
      {:path => "/new_user", :method => :post},
      {:controller => "users", :action => "create"}
    )
  end 

end