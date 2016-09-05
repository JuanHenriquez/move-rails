class Post::PostComment < ApplicationRecord

    self.table_name = "post_comments"
    belongs_to :user
    belongs_to :post

    validates :text, presence: true, length: { minimum: 3, maximum: 50 }

end
