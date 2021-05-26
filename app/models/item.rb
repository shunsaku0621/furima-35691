class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    # validates :category_id
    # validates :status_id
    # validates :shipping_fee_id
    # validates :prefecture_id
    # validates :delivery_id
    validates :price
    validates :image
  end
  #ActiveHashのバリデーション
  validates :category_id, numericality: {other_than: 1}
  validates :status_id, numericality: {other_than: 1}
  validates :shipping_fee_id, numericality: {other_than: 1}
  validates :delivery_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 1}

  
#ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :delivery
  belongs_to :prefecture


#通常のアソシエーション
  belongs_to :user
  has_one_attached :image
end
