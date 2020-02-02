class AfVenueMapping < ApplicationRecord
  belongs_to :af_venue
  belongs_to :performance_space
  belongs_to :source_org
  validates :af_venue, :performance_space, presence: true
  validates :af_venue, uniqueness: { scope: :source_org }
end
