class UserSessionsController < ApplicationController
  layout "main"
  
  def new
    @user_session = UserSession.new
  end
  
 def create
   @user_session = UserSession.new(params[:user_session])
   @user_session.save do |result|
     if result
       flash[:notice] = "Connexion réussie"
       redirect_to root_url
     end
   end
   if !performed? # no render or redirect yet
     render :action => 'new'
   end
 end

 def destroy
   @user_session = UserSession.find
   @user_session.destroy
   flash[:notice] = "Déconnexion effectuée"
   redirect_to root_url
 end
 
end
