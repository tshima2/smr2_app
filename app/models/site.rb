class Site < ApplicationRecord
  validates :title, presence:true, length:{ maximum:100 }
  validates :geom, presence:true
  validates :address, length:{ maximum:100 }
  validates :description, length:{ maximum:4000 }

  has_many :image_posts, dependent: :destroy
  belongs_to :user
  belongs_to :team
end
