class User < ActiveRecord::Base
  has_many :posts
  # this was added to handdle user images
  #has_attached_file :avatar, 
  #                 :styles => { :medium => "300x300>",
  #                              :thumb => "100x100>" }

  
attr_accessor :password_confirmation
attr_reader :password

validates_uniqueness_of :email, :message => ": a user already exsists with the entered email "
validates_presence_of :password, :firstname , :lastname, :email, :address, :repassword,
                                                         :message => ": can not be left empty !"
validates_confirmation_of :password
validates_numericality_of :phone, :on => :create, :meaage => ": is not a valid phone number "
validates_length_of :password, :within => 8..90, :message => ": too short, must be between 8 - 90"
validates_format_of  :email,
                    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,
                    :message => ": must fulfill the formatt 'name@doman.com'"

  def password=(pwd)
  @password = pwd
  return if pwd.blank?
  create_new_salt
  self.hashed_password = User.encrypted_password(pwd, self.salt)
   
  end
  # Returns user if the supplied email and password match with database
  
  def User.authenticate(email, password)
    user = User.find_by_email(email)
    if user
      password_attempt = User.encrypted_password(password, user.salt)
      if password_attempt != user.hashed_password
        user = nil
      end
    end
    return user
  end
  
  private
  def create_new_salt
    # generates some values and stored intro the databse 
  self.salt = Digest::SHA256.hexdigest(Time.now.to_s + rand.to_s)
  end
  
  def User.encrypted_password(pwd, salt)
    string_to_hash = pwd + salt
    Digest::SHA256.hexdigest(string_to_hash)
  end
  

end
