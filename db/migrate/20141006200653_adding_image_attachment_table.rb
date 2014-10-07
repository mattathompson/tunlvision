class AddingImageAttachmentTable < ActiveRecord::Migration
  def change
    create_table :image_attachments do |t|
      t.integer :deliverable_id



    end
  end
end
