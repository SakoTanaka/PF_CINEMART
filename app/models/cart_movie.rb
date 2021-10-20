class CartMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :request, presence: true
end
