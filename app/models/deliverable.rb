class Deliverable < ActiveRecord::Base
  validates_presence_of :project_id, :title
  belongs_to :project





end
