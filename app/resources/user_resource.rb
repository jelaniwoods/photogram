class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :likes,
             foreign_key: :fan_id

  has_many   :comments,
             foreign_key: :author_id

  has_many   :own_photos,
             resource: PhotoResource,
             foreign_key: :owner_id

  has_many   :received_follow_requests,
             resource: FollowRequestResource,
             foreign_key: :recipient_id

  has_many   :sent_follow_requests,
             resource: FollowRequestResource,
             foreign_key: :sender_id

  # Indirect associations

  has_many :followers, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.followers.map(&:id))
      end
    end
  end

  has_many :following, resource: UserResource do
    assign_each do |user, users|
      users.select do |u|
        u.id.in?(user.following.map(&:id))
      end
    end
  end

  has_many :feed, resource: PhotoResource do
    assign_each do |user, photos|
      photos.select do |p|
        p.id.in?(user.feed.map(&:id))
      end
    end
  end

  many_to_many :liked_photos,
               resource: PhotoResource

  filter :owner_id, :integer do
    eq do |scope, value|
      scope.eager_load(:feed).where(photos: { owner_id: value })
    end
  end

  filter :sender_id, :integer do
    eq do |scope, value|
      scope.eager_load(:followers).where(follow_requests: { sender_id: value })
    end
  end

  filter :recipient_id, :integer do
    eq do |scope, value|
      scope.eager_load(:following).where(follow_requests: { recipient_id: value })
    end
  end
end
