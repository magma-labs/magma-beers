class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
         has_many :beer_logs, dependent: :destroy
  has_attached_file :photo,
    styles: { thumbnail: "300x300>", thumb: "150x150>", small: "20x20" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  include Gravtastic
  gravtastic

  after_create :assign_role

  validates_uniqueness_of :email
  validates_presence_of :email

  def self.from_omniauth(auth)
    where(provider: auth.provider.to_s, uid: auth.uid.to_s).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.skip_confirmation!
    end
  end

  def assign_role
    add_role(:user)
  end

  def count_beers_by_week
    beer_logs.where(
      created_at: (Time.now.midnight - 1.week)..Time.now
    ).sum('quantity').to_i
  end
end
