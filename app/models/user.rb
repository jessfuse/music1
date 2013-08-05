class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :soundcloud_token 

  validates_presence_of :username 
  validates_uniqueness_of :username 

  has_many :songs

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname 
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params 
        user.valid?
      end 
    else 
      super
    end 
  end 

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def fetch_songs 
    @client = Soundcloud.new(:access_token => self.soundcloud_token)

      # '#{@user.soundcloud_token}')

    # get playlist
    playlists = @client.get('/playlists/405726')
    playlists.tracks.each do |track|
      puts track.uri
      puts track.id 
    end

  end

end