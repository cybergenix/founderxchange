class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, :styles => { :medium => "300x", :thumb => "100x100>" }, :default_url => "default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, #,:confirmable #This is a comment.
         :omniauthable, :omniauth_providers => [:facebook]

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
    user.image = current_user.largeimage # assuming the user model has an image
      end
  end

  validates :name, presence: true
  validates_attachment_presence :image, presence: true

  has_many :postings, dependent: :destroy
  has_one :profile, dependent: :destroy
end
