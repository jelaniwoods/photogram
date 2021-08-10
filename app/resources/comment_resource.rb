class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :body, :string
  attribute :author_id, :integer
  attribute :photo_id, :integer

  # Direct associations

  belongs_to :photo

  belongs_to :author,
             resource: UserResource

  # Indirect associations
end
