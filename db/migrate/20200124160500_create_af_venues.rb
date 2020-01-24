class CreateAfVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :af_venues do |t|
      t.string :venue_name
      t.references :theatre, foreign_key: true
      t.references :performance_space, foreign_key: true

      t.timestamps
    end
  end
end
