class AddDescriptionToImageAttachments < ActiveRecord::Migration
  def change
    add_column :image_attachments, :title, :string
    add_column :image_attachments, :description, :text
  end
end
