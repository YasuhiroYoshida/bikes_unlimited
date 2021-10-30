class Upload < ApplicationRecord
  has_one_attached :csv
  has_many :users
end
