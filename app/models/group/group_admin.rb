class Group::GroupAdmin < ApplicationRecord

    self.table_name = "group_admins"
    belongs_to :group
    belongs_to :user

end
