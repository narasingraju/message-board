class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    belongs_to :user

    # def self.search(query)
    #   where("desc LIKE ?", "%#{query}%")   
    #  end
end
