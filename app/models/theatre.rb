class Theatre < ApplicationRecord
  has_many :performance_spaces
  has_many :af_venues
  validates :name, presence: true, uniqueness: true
  validates :af_source_org_id, uniqueness: true
  validates :status, presence: true
end
