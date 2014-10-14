class AddUserAndProjectToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :user_id, :integer
    add_column :videos, :project_id, :integer
  end
end
