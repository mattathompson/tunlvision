class ImageAttachment < ActiveRecord::Base
  belongs_to :deliverable
  belongs_to :project

  has_attached_file :image, :styles => {
    :medium => "300x300#",
    :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  #validates :avatar,
  #  attachment_content_type: { content_type: /\Aimage/ },
  #  attachment_size: { less_than: 4.megabytes }

  #Convert_options does the blur post-processing for square_blur
  #has_attached_file :avatar,
  #  styles: {
  #    square: '160x160#',
  #    medium: '300x300#',
  #    square_blur: '200x200#'
  #  },
  #  convert_options: { square_blur: '-blur 0x8' }

  #def avatar_remote_url=(url_value)
  #  self.avatar = URI.parse(url_value) unless url_value.blank?
  #  super
  #end

  #before_save { self.avatar_remote_url = avatar_url }


  def is_main?
    self.main
  end




end
