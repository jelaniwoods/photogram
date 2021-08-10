class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :comments,
             dependent: :destroy

  has_many   :likes,
             dependent: :destroy

  belongs_to :owner,
             class_name: "User",
             counter_cache: :own_photos_count

  # Indirect associations

  has_many   :followers,
             through: :owner,
             source: :followers

  # Validations

  validates :image, presence: true

  validates :owner_id, uniqueness: { scope: [:caption] }

  validates :owner_id, presence: true

  # Scopes

  def to_s
    caption
  end
end
