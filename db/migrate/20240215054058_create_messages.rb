class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages, primary_key: "message_id", id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :content
      t.uuid :conversation_id
      t.uuid :sender
      t.uuid :receiver
      t.integer :number
      
      t.timestamps
    end
  end
end
