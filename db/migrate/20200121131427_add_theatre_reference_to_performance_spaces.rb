class AddTheatreReferenceToPerformanceSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :performance_spaces, :theatre, foreign_key: true
  end
end
