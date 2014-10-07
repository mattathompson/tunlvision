class AddAttachmentImageToImageAttachments < ActiveRecord::Migration
  def self.up
    change_table :image_attachments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_attachments, :image
  end
end
