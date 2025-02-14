class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 5..500 }

  belongs_to :supplier
  
  def is_discounted?
    if price < 10
    end
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    (tax + price).round(2)
  end
end
