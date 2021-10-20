class ApplicationDetail < ApplicationRecord
  belongs_to :application
  belongs_to :movie
end
