class Photo < ApplicationRecord

    belongs_to :user
    has_many :likes, :class_name => "PhotoLike"
    has_many :dislikes, :class_name => "PhotoDislike"
    has_many :comments, :class_name => "PhotoComment"

    has_attached_file :picture, styles: { large: "1000x1000>", medium: "600x600>", small: "100x100>" }
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
