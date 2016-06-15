class Playlist < ActiveRecord::Base

  has_and_belongs_to_many :users
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"

  has_many :videos
end
