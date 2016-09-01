class Post::PostDislike < ApplicationRecord

    self.table_name = "post_dislikes"
    belongs_to :user
    belongs_to :post

end
