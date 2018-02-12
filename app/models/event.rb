class Event < ApplicationRecord
  EVENT_CAPACITY = (1..25).to_a
  BARGAIN = 40

  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }

  def bargain?
    price < BARGAIN
  end

  def self.order_by_price
    order :price
  end



end
