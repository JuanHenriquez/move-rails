class Group::GroupMember < ApplicationRecord

    self.table_name = "group_members"
    belongs_to :group
    belongs_to :user

end
