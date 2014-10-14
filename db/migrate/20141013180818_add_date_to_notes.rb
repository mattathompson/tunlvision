class AddDateToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :created_at, :datetime
  end
end
