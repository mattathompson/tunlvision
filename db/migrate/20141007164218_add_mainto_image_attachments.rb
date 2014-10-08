class AddMaintoImageAttachments < ActiveRecord::Migration
  def change
    add_column :image_attachments, :main, :boolean, default: false
  end
end
