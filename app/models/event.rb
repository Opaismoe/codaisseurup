class Event < ApplicationRecord
  EVENT_CAPACITY = ["1","2","3","4","5","6","7","8","9"]
  BARGAIN = 40

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy



  validates :name, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 100 }
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
