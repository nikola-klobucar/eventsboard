class Comment < ApplicationRecord
  belongs_to :event

  validates :body, presence: true
end
