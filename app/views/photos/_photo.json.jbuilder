json.extract! photo, :id, :caption, :image, :owner_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
