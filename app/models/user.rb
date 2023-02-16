class User < ApplicationRecord
  has_secure_password
  has_many :gossips
  belongs_to :city
  belongs_to :session
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "RecipientList"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :password, presence: true, length: { minimum: 6 }

end
