class RegisteredApp < ActiveRecord::Base
  belongs_to :user
  before_save { self.url = url.downcase }
  validates_uniqueness_of :url
end
