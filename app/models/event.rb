class Event < ApplicationRecord
  EVENT_CAPACITY = (1..25).to_a
  BARGAIN = 40

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy

  validates :starts_at, :ends_at, :presence => true
  validate :end_after_start


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

  def end_after_start
    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end



end
