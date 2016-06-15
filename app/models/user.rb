class User < ActiveRecord::Base
  has_attached_file :avatar, styles: {thumb: '100x100>', square: '200x200#', medium: '300x300>'}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # has_attached_file :picture, :styles => { :thumb => "200x200#" }
  has_and_belongs_to_many :playlists
  has_many :owned, :class_name => "Playlist"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
