class Order < ApplicationRecord
  has_many :product, through: :carted_product
end
