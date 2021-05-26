class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end
  #ActiveHashのバリデーション
  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :delivery_id
    validates :prefecture_id
  end
  
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
