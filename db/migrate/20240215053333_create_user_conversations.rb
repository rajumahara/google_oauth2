class CreateUserConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :user_conversations, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.uuid :user_id
      t.uuid :conversation_id

      t.timestamps
    end
  end
end
