class Pic < ApplicationRecord
	validates :user_id, presence: true
	validates :image, presence: true
	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	validates :content, length: { minimum: 3, maximum: 300 }

	belongs_to :user
	has_many :comments, dependent: :destroy
end
