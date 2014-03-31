class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :timeoutable,
         timeout_in: 120.minutes

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 15 }
  validates :last_name,  presence: true, length: { maximum: 25 }
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password,
            confirmation: true,
            presence: true,
            length: { minimum: 6 },
            on: :create
  validates :password,
            confirmation: true,
            presence: true,
            length: { minimum: 6 },
            on: :update,
            allow_blank: true

  has_many :swim_records

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
end
