class Movie < ApplicationRecord
  attachment :image

  has_many :cart_movies, dependent: :destroy
  belongs_to :genre

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :staff, presence: true
  validates :cast, presence: true
  validates :releasedate, presence: true
  validates :copyright, presence: true
  validates :image, presence: true

end
