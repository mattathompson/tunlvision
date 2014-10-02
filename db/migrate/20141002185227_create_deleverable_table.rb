class CreateDeleverableTable < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.string :title
      t.text :description
      t.datetime :timebox
      t.integer :project_id
    end
  end
end
