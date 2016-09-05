class Post < ApplicationRecord

    belongs_to :user
    has_many :likes, :class_name => "PostLike", dependent: :destroy
    has_many :dislikes, :class_name => "PostDislike", dependent: :destroy
    has_many :comments, :class_name => "PostComment", dependent: :destroy

end
