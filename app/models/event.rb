class Event < ApplicationRecord
  BARGAIN = 40

  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: { maximum: 50 }
  validates :starts_at, presence: true
  # validates :ends_at, presence: true

  validates :starts_at, presence: true
  validates :description, presence: true, length: { maximum: 500 }

  def bargain?
    price < BARGAIN
  end

  def self.order_by_price
    order :price
  end



end
