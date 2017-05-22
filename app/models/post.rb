class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    belongs_to :user
    validates :title, presence: true
    # def self.search(query)
    #   where("desc LIKE ?", "%#{query}%")   
    #  end
end
