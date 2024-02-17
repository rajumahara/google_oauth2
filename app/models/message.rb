class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :sender_user, class_name: 'User', foreign_key: 'sender', optional: true
    belongs_to :receiver_user, class_name: 'User', foreign_key: 'receiver', optional: true
end
