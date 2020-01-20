class Theatre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :af_source_org_id, uniqueness: true
end
