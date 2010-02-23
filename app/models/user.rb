class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.session_class = UserSession
    c.openid_required_fields = [:fullname]
  end

  private

  #Permet de récupérer des infos de l'utilisateur depuis openid
  #Devine la répartition nom et prénom depuis le fullname
  def map_openid_registration(registration)
    if registration["fullname"] == nil
      raise "OpenID should provide fullname data"
    end
    names = registration["fullname"].split
    self.firstname = names[0..names.size - 2].join(" ") if names[0]
    self.lastname = names[names.size - 1] if names.size > 1
    generate_username
  end 
  
  #Génère le username à partir des nom et prenom
  def generate_username
    self.username = ""
    if self.firstname
      firstnames = self.firstname.split /[ -]/
      firstnames.each {|w| self.username << w[0..0]}
    end
    self.username << self.lastname if self.lastname
    self.username = self.username.downcase
  end

end
