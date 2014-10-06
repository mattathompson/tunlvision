class Project < ActiveRecord::Base
  validates_presence_of :title, :deadline, :description, :client, :user_id
  belongs_to :user
  has_many :deliverables


  def upcomming_deadlines
    self.where(deadline: (Time.now..(Time.now + 1.year)))
  end




end
