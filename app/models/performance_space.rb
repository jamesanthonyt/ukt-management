class PerformanceSpace < ApplicationRecord
  belongs_to :theatre
  validates :name, presence: true
  validates :theatre_id, presence: true
end
