class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User", foreign_key: "user_id"

    validates :title, presence: true, length: {minimum: 5}
    validates :venue, presence: true
    validates :location, presence: true
end
