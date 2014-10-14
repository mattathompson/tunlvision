class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :title
      t.integer :user_id
      t.integer :project_id
    end
  end
end
