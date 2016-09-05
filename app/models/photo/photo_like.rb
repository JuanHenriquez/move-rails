class Photo::PhotoLike < ApplicationRecord

    self.table_name = "photo_likes"
    belongs_to :photo
    belongs_to :user

end
