class User < ActiveRecord::Base
    has_many :likes
    has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    #mount_uploader :avatar, AvatarUploader
      has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
