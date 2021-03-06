class Post < ActiveRecord::Base
  mount_uploader :avatar_file_name, PostImageUploader
  ratyrate_rateable "quality", "originality"

  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/assets/avatar_defecto.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 1.megabyte
  self.per_page = 10

  
  has_many :comments, dependent: :destroy
  belongs_to :user

  def timestamp
    created_at.strftime('%d %B %Y %H:%M:%S')
  end

end
