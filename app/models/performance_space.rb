class PerformanceSpace < ApplicationRecord
  belongs_to :theatre
  has_many :af_venues
  validates :name, presence: true, uniqueness: { scope: :theatre_id }
  validates :theatre_id, :space_type, :capacity, :programme, presence: true
end
