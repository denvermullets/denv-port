class Project < ApplicationRecord
  has_many :urls
  has_many :tags
end
