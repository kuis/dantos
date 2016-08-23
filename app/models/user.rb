class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :goomps, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :authorizations, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :joined_goomps, through: :memberships, class_name: "Goomp", source: :goomp
  has_many :posts_from_joined_goomps, through: :joined_goomps, source: :posts
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :first_name, :last_name, :picture, presence: true

  extend FriendlyId
  friendly_id :full_name, use: :slugged

  def is_founder_of? goomp
    goomp.user == self
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def join goomp, token = nil
    membership = Membership.where(user: self, goomp: goomp).first_or_initialize

    if membership.persisted?
      if goomp.user_id == self.id
        # Founder can't unjoin his own group
        return false
      else
        membership.destroy
      end
    else
      if goomp.price > 0
        StripeService.subscribe self, @goomp, token
      end

      membership.save
    end
  end

  def self.from_omniauth auth
    authdata = case auth.provider
    when "twitter"
      {
        email: auth.info.email,
        first_name: auth.info.name.split(" ").first,
        picture: auth.info.image.gsub("_normal", ""),
        last_name: auth.info.name.split(" ").last,
        uid: auth.uid,
        token: auth.credentials.token,
        refresh_token: auth.credentials.refresh_token,
        expires_at: auth.credentials.expires_at,
        username: auth.info.nickname,
        provider: "twitter"
      }
    when "linkedin"
      {
        email: auth.info.email,
        first_name: auth.info.first_name,
        picture: auth.info.image,
        last_name: auth.info.last_name,
        uid: auth.uid,
        token: auth.credentials.token,
        refresh_token: auth.credentials.refresh_token,
        expires_at: auth.credentials.expires_at,
        provider: "linkedin"
      }
    when "facebook"
      {
        email: auth.info.email,
        first_name: auth.info.first_name,
        picture: auth.info.image.gsub("square", "large"),
        last_name: auth.info.last_name,
        uid: auth.uid,
        token: auth.credentials.token,
        refresh_token: auth.credentials.refresh_token,
        expires_at: auth.credentials.expires_at,
        provider: "facebook"
      }
    end

    auth = Authorization.find_by uid: authdata[:uid], provider: authdata[:provider]

    return auth&.user || authdata
  end
end
