class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :username,
            presence: true,
            uniqueness: true

  has_one :profile, dependent: :destroy
  has_one :account, dependent: :destroy

  has_many :conversations, foreign_key: :sender_id
  has_many :messages, through: :conversations

  has_many :likes, as: :likable
  has_many :user_likes, class_name: "Like", foreign_key: :user_id, inverse_of: :user

  after_create :make_profile, :make_account

  def self.new_with_session(params, session)
	  super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
			  user.email = data["email"] if user.email.blank?
		  end
	  end
  end

  def self.from_omniauth(auth)
		binding.pry
	  where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
		  user.email = auth["info"]["email"]
		  user.password = Devise.friendly_token[0,20]
		  user.name = auth["info"]["name"]
		  user.image = auth["info"]["image"]
	  end
  end

	private
  def make_profile
	  self.create_profile
  end

  def make_account
	  self.create_account
  end
end
