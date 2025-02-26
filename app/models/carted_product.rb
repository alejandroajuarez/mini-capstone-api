class CartedProduct < ApplicationRecord
  has_many :product
  belongs_to :order, optional: true
end
