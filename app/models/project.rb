class Project < ActiveRecord::Base
  validates_presence_of :title, :deadline, :description, :client, :user_id
  belongs_to :user
  has_many :deliverables




end
