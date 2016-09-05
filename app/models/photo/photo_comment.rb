class Photo::PhotoComment < ApplicationRecord

    self.table_name = "photo_comments"
    belongs_to :photo
    belongs_to :user
end
