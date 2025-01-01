class Project < ApplicationRecord
  has_one_attached :thumbnail
  has_many :urls, dependent: :destroy
  has_many :tags, dependent: :destroy
end
