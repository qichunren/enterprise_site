class Page < ActiveRecord::Base
  validates :url_slug, :presence => true, :uniqueness => true
end
