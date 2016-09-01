class Group < ApplicationRecord

    has_many :admins, :class_name => "GroupAdmin"
    has_many :members, :class_name => "GroupMember"
    has_many :posts, :class_name => "GroupPost"

end
