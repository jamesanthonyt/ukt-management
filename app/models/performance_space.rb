class PerformanceSpace < ApplicationRecord
  belongs_to :theatre
  has_many :af_venue_mappings
  has_many :af_venues, through: :af_venue_mappings
  validates :name, presence: true, uniqueness: { scope: :theatre_id }
  validates :theatre_id, :grouping, :space_type, :capacity, :programme, presence: true
end
