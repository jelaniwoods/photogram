class AddOwnerReferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :photos, :users, column: :owner_id
    add_index :photos, :owner_id
  end
end
