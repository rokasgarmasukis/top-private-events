class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  has_many :attendees, through: :event_attendences, source: :event_attendee
  has_many :event_attendences, foreign_key: :attended_event_id
end
