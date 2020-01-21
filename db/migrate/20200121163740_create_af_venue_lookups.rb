class CreateAfVenueLookups < ActiveRecord::Migration[5.2]
  def change
    create_table :af_venue_lookups do |t|
      t.references :theatre
      t.references :performance_space
      t.string :af_venue

      t.timestamps
    end
  end
end
