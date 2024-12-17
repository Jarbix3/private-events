class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }

  validates :location, presence: true
  validates :category, presence: true
  validates :date, presence: true
end
