class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :barroom_users
  has_many :barrooms, through: :barroom_users
  has_many :messages

  has_attached_file :avatar, styles: { medium: "50x50>" }, default_url: "fallback-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  include PgSearch

  pg_search_scope :search_for, :against => [:username]
end
