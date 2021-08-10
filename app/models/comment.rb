class Comment < ApplicationRecord
  # Direct associations

  belongs_to :photo,
             counter_cache: true

  belongs_to :author,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :author_id, presence: true

  validates :body, presence: true

  validates :photo_id, presence: true

  # Scopes

  def to_s
    body
  end
end
