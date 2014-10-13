class CreateRelationshipTable < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :project
      t.belongs_to :user
    end
  end
end
