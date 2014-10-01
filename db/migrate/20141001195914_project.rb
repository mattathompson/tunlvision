class Project < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :client
      t.text :description
      t.datetime :deadline      
    end
  end
end
