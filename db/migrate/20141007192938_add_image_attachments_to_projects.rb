class AddImageAttachmentsToProjects < ActiveRecord::Migration
  def change
    add_column :image_attachments, :project_id, :integer
  end
end
