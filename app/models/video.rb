class Video < ActiveRecord::Base
  validates_presence_of :project_id, :user_id, :url, :title

  belongs_to :project_id
  belongs_to :user_id






end
