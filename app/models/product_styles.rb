class ProductStyles < ApplicationRecord
  belongs_to :product
  belongs_to :style
  belongs_to :attachment
  has_many :attachments
end
