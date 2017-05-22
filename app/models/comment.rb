class Comment < ActiveRecord::Base
    belongs_to :post
    has_many :likes
    has_many :comment_likes
end
