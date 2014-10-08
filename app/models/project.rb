class Project < ActiveRecord::Base
  validates_presence_of :title, :deadline, :description, :client, :user_id
  belongs_to :user
  has_many :deliverables
  paginates_per 6
  has_many :image_attachments

  include PgSearch
	pg_search_scope :search, against: [:title, :description],
		using: {tsearch: {dictionary: "english"}}


  def upcomming_deadlines
    self.where(deadline: (Time.now..(Time.now + 1.year)))
  end

  def has_main_image?
    main_images = image_attachments.select { |image| image.is_main? }
    !main_images.empty?
  end

  def main_image
    main_images = image_attachments.select { |image| image.is_main? }
    main_images.first.image.url
  end

  def self.ordered(params)
    order(:deadline).page params[:page]
  end

  def ratio
    completed = deliverables.select{|d| d.completed}
    "#{completed.length} / #{deliverables.length}"
  end

  def self.text_search(query)
    if query.present?
      search(query)
			#where("to_tsvector('english', book) @@ :q or to_tsvector('english', outline) @@ :q", q: query)
    else
      all
    end
	end






end
