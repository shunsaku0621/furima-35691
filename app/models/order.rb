class Order < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination

  #バリデーション
  with_options presence: true do
    validates :post_num
    validates :city
    validates :address
    validates :phone_num
  end

  #ActiveHashのバリデーション
  validates :prefecture_id, numericality: { other_than: 1 }

  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
