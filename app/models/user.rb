class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
   super && (self.is_active == true)
  end

  has_many :cart_movies, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :applications, dependent: :destroy

  validates :last_name, :address, presence: true
  validates :first_name, :address, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :company, presence: true
  validates :company_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :department, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/}
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/}
end
