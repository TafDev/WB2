class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy

  after_create :make_profile #:make_account

  def self.new_with_session(params, session)
	  super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
			  user.email = data["email"] if user.email.blank?
		  end
	  end
  end

  def self.from_omniauth(auth)
	  where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
		  user.email = auth["user_info"]["email"]
		  user.password = Devise.friendly_token[0,20]
		  user.name = auth["user_info"]["name"]   # assuming the user model has a name
		  user.image = auth["user_info"]["image"] # assuming the user model has an image
		  # If you are using confirmable and the provider(s) you use validate emails,
		  # uncomment the line below to skip the confirmation emails.
		  # user.skip_confirmation!
	  end
  end

	private
  def make_profile
	  self.create_profile
  end
  #
  # def make_account
	 #  self.create_account
  # end
end
