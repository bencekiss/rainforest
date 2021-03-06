class Product < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}


  def formatted_price
    price_in_dollars = self.price_in_cents/100.0
    sprintf("%.2f", price_in_dollars)
  end
end
