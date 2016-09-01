class PhotoDislike < ApplicationRecord

    self.table_name = "photo_dislikes"
    belongs_to :photo
    belongs_to :user
end
