class ProductStyle < ApplicationRecord
  belongs_to :product
  belongs_to :style
  belongs_to :attachment, required: false
  has_many :attachments
  validates_uniqueness_of :product_id, :scope => :style_id
end
