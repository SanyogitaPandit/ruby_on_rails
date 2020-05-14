class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendees, source: :event_attendee
    scope :past, -> { where('events.dnt < ?', DateTime.now) }
    scope :upcoming, -> { where('events.dnt >= ?', DateTime.now) }
end
