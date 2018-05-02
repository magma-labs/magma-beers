class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  rolify
  devise :database_authenticatable, :registerable, :async, :validatable,
         :recoverable, :rememberable, :trackable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :beer_logs, dependent: :destroy
  has_attached_file :photo,
    styles: { thumbnail: "300x300>", thumb: "150x150>", small: "20x20" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  include Gravtastic
  gravtastic

  after_create :assign_role
  before_validation :set_uid

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

  def set_uid
    self.uid = self.class.generate_uid if self.uid.blank?
  end

  def self.generate_uid
    loop do
      token = Devise.friendly_token
      break token unless to_adapter.find_first({ uid: token })
    end
  end

  def count_beers_by_week
    beer_logs.where(
      created_at: (Time.now.midnight - 1.week)..Time.now
    ).sum('quantity').to_i
  end
end
