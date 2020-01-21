class Theatre < ApplicationRecord
  has_many :performance_spaces
  validates :name, presence: true, uniqueness: true
  validates :af_source_org_id, uniqueness: true
end
