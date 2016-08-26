class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_attached_file :photo, styles: { small: "64x64", med: "300x300", large: "600x600" }
  validates_attachment :photo, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def self.search(search)
  	where("content ILIKE ? OR title ILIKE ?", "%#{search}%", "%#{search}%")
  end
end