class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  has_many :user_conversations
  has_many :conversations, through: :user_conversations
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender', inverse_of: :sender_user
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver', inverse_of: :receiver_user
end
