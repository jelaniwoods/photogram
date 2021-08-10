class AddSenderReferenceToFollowRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :follow_requests, :users, column: :sender_id
    add_index :follow_requests, :sender_id
  end
end
