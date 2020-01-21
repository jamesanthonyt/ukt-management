class PerformanceSpace < ApplicationRecord
  belongs_to :theatre
  validates :name, presence: true
end
