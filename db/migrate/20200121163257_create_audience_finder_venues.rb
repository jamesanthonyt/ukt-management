class CreateAudienceFinderVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :audience_finder_venues do |t|
      t.integer :srcorgid
      t.string :venue
      t.timestamps
    end
  end
end
