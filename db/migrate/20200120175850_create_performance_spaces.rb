class CreatePerformanceSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :performance_spaces do |t|
      t.string :name
      t.string :type
      t.string :type_other
      t.integer :capacity
      t.string :programme
      t.string :grouping
      t.boolean :include
      t.text :notes

      t.timestamps
    end
  end
end
