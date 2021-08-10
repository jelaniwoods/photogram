class Like < ApplicationRecord
  # Direct associations

  belongs_to :fan,
             class_name: "User"

  belongs_to :photo

  # Indirect associations

  # Validations

  validates :fan_id, presence: true

  validates :photo_id,
            uniqueness: { scope: [:fan_id], message: "already liked" }

  validates :photo_id, presence: true

  # Scopes

  def to_s
    created_at
  end
end
