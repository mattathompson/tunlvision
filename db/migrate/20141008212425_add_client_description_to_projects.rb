class AddClientDescriptionToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :client_description, :text
  end
end
