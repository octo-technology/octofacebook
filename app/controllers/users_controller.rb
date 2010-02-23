require 'TwitterProxy'

class UsersController < ApplicationController
  layout "main"

  # GET /
  def index
    @users = User.all
  end

  # GET /:username
  def show
    begin
      @user = User.find_by_username!(params[:username])
      if @user.twitter_identifier
        @twitts = TwitterProxy.new.get_last_twitts_for_user @user.twitter_identifier
      else  
        @twitts = []
      end
    rescue ActiveRecord::RecordNotFound 
      flash[:warning] = "Pas de page pour l'utilisateur #{params[:username]}"
      redirect_to root_path
    end
  end
  
  # GET /new_user
  def new
    @user = User.new
  end

  # POST /new_user
  def create
   @user = User.new(params[:user])
   @user.save do |result|
     if result
         flash[:notice] = 'Page créée avec succès'
         redirect_to edit_page_path(@user.username)
     else
       flash[:error] = "Une erreur a empêché la création de la page !"
       render :action => :new
     end
   end
  end
  
  # GET /:username/edit
  def edit
    @user = User.find_by_username!(params[:username])
  end

  # PUT /:username/update
  def update
    @user = User.find_by_username!(params[:username])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Page mise à jour avec succès'
      redirect_to :action => "show"
    else
      render :action => "edit"
    end
  end
  
  
  def destroy
      user_session = UserSession.find
      @user = User.find_by_username(params[:username])
      @user.destroy
      user_session.destroy
      flash[:notice] = "Compte désactivé avec succès."
      redirect_to root_url
  end

end
