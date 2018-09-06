class Idea < ApplicationRecord
  require 'obscenity/active_model'
  require 'obscenity/rack'

  validates :description, presence: true,  obscenity: { sanitize: true, replacement: "[censored]" }
  belongs_to :user
  has_many :comments
  acts_as_taggable

  
  #use Rack::Obscenity, {} # options Hash
  #use Rack::Obscenity, sanitize: true
end
