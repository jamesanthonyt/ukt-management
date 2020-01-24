class PerformanceSpace < ApplicationRecord
  belongs_to :theatre
  validates :name, presence: true, uniqueness: { scope: :theatre_id }
  validates :theatre_id, :space_type, :capacity, :programme, presence: true
end
