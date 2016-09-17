class Project < ApplicationRecord
  belongs_to :product
  belongs_to :style
end
