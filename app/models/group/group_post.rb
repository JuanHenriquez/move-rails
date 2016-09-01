class Group::GroupPost < ApplicationRecord

    self.table_name = "group_posts"
    belongs_to :group
    belongs_to :user

end
