class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_many :post_images, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image 
    unless profile_image.attached?
      file_path = Rails.root.join('app/assetsimages/sample-author1.jpg')
      profile_image_attach(io:File.open(file_path),filename:'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
end
