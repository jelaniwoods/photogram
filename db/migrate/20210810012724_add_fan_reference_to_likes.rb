class AddFanReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :users, column: :fan_id
    add_index :likes, :fan_id
  end
end
