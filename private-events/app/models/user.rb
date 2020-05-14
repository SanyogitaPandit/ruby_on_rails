class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :event_attendees, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendees

  def attend(event_id)
    EventAttendee.create(event_attendee_id: id, attended_event_id: event_id)
  end

  def do_not_attend(event_id)
    attended_events.delete(event_id)
  end
end
