class AddCompletedToDeliverables < ActiveRecord::Migration
  def change
    add_column :deliverables, :completed, :boolean, default: false
  end
end
