class Application < ApplicationRecord
  belongs_to :user
  has_many :application_details, dependent: :destroy

  validates :user_id, presence: true
  validates :media, presence: true
  validates :purpose, presence: true
  validates :date, presence: true

end
