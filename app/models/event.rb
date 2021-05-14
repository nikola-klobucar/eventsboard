class Event < ApplicationRecord

    validates :title, presence: true, length: {minimum: 5}
    validates :venue, presence: true
    validates :location, presence: true
end
