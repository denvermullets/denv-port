class Project < ApplicationRecord
  has_one_attached :thumbnail
  has_many :urls
  has_many :tags
end
