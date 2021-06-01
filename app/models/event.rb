class Event < ApplicationRecord
    searchkick
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :organizer, class_name: "User", foreign_key: "user_id"
    belongs_to :category
    has_many :comments, dependent: :destroy
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances

    validates :title, presence: true, length: {minimum: 5}
    validates :venue, presence: true
    validates :location, presence: true

    mount_uploader :image, ImageUploader
end
