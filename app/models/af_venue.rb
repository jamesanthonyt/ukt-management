class AfVenue < ApplicationRecord
  belongs_to :theatre
  validates :theatre_id, presence: true
end
