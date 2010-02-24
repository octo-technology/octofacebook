require 'TwitterProxy'
require 'rss'

class UsersController < ApplicationController

  # GET /
  def index
    @users = User.all
  end

  # GET /:username
  def show
    begin
      @user = User.find_by_username!(params[:username])
      
      #Récupération des twitts
      unless @user.twitter_identifier.blank?
        @twitts = TwitterProxy.new.get_last_twitts_for_user @user.twitter_identifier
      else  
        @twitts = []
      end
      
      #Récupération des 3 derniers posts (tronqués à 500 caractère)
      unless @user.blog_feed_url.blank?
        @blog_posts = RSS::Parser.parse(open(@user.blog_feed_url).read, false).items.first(3).collect { |post| 
           {:title => post.title, :link => post.link, :content => post.description.first(500)}
        }
      else
        @blog_posts = []
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
    if current_user && current_user.username == params[:username]
      @user = User.find_by_username!(params[:username])
    else
       flash[:error] = "Tu n'as pas les droits canaillou !"
       redirect_to root_path
    end
  end

  # PUT /:username/update
  def update
    if current_user && current_user.username == params[:username]
      @user = User.find_by_username!(params[:username])
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Page mise à jour avec succès'
        redirect_to :action => "show"
      else
        render :action => "edit"
      end
    else
       flash[:error] = "Tu n'as pas les droits canaillou !"
       redirect_to root_path
    end
  end
  
  
  def destroy
    if current_user && current_user.username == params[:username]
      user_session = UserSession.find
      @user = User.find_by_username(params[:username])
      @user.destroy
      user_session.destroy
      flash[:notice] = "Compte désactivé avec succès."
      redirect_to root_url
    else
      flash[:error] = "Tu n'as pas les droits canaillou !"
      redirect_to root_path
    end
  end

end
