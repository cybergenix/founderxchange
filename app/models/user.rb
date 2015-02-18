class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, :styles => { :medium => "300x", :thumb => "100x100>" }, 
  :default_url => "http://static1.squarespace.com/static/531173e3e4b05444a30866c4/53118426e4b02a8d250f7351/5311870ae4b01148f94c6753/1393657611367/user-avatar-placeholder.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, #,:confirmable #This is a comment.
         :omniauthable, :omniauth_providers => [:facebook, :linkedin]

def largeimage
"http://graph.facebook.com/#{self.uid}/picture?type=large"
end

 def normalimage
"http://graph.facebook.com/#{self.uid}/picture?type=normal"
end

def smallimage 
  "http://graph.facebook.com/#{self.uid}/picture?type=small" 
end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = current_user.image # assuming the user model has an image
      end
  end


  def self.connect_to_linkedin(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.info.first_name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end  

  validates :name, presence: true
  validates_attachment_presence :image, presence: true

  has_many :postings, dependent: :destroy
  has_one :profile, dependent: :destroy
end
