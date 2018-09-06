class Post < ApplicationRecord

  require 'obscenity/active_model'
  require 'obscenity/rack'
  
  belongs_to :user
  has_many :comments
  validates :photo, :caption, :user_id, presence: true, obscenity: { sanitize: true, replacement: "[censored]" }
  mount_uploader :photo, PhotoUploader
end
