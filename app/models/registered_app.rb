class RegisteredApp < ActiveRecord::Base
  belongs_to :user
  has_many :events
  before_save { self.url = url.downcase }
  validates_uniqueness_of :url
end
