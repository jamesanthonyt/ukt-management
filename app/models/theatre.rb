class Theatre < ApplicationRecord
  belongs_to :source_org, optional: true
  has_many :performance_spaces
  has_many :af_venues, through: :source_org
  validates :name, presence: true, uniqueness: true
  validates :source_org_id, uniqueness: true
end
