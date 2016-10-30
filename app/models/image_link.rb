class ImageLink < ActiveRecord::Base
  scope :recent, lambda { order('created_at DESC').limit(5) }
end
