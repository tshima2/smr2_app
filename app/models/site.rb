class Site < ApplicationRecord
  validates :title, presence:true, length:{ maximum:100 }
  validates :geom, presence:true
  validates :address, length:{ maximum:100 }
  validates :description, length:{ maximum:1000 }

  belongs_to :user
end
