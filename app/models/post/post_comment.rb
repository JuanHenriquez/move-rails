class Post::PostComment < ApplicationRecord

    self.table_name = "post_comments"
    belongs_to :user
    belongs_to :post

end
