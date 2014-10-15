class ChangeDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :deliverables, :timebox, :date
  end
end
