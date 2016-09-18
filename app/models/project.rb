class Project < ApplicationRecord
  belongs_to :product
  belongs_to :style
  has_many :attachments, inverse_of: :project
end
