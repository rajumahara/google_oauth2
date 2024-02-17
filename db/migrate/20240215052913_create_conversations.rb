class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations, primary_key: "conversation_id", id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.uuid :created_by
      t.string :conversation_type
      t.integer :user_count
      t.string :thread_name
      t.timestamps
    end
  end
end
