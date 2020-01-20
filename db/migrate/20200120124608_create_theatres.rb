class CreateTheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :theatres do |t|
      t.string :name
      t.string :managed_by
      t.integer :af_source_org_id
      t.text :notes

      t.timestamps
    end
  end
end
