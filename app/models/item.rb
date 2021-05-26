class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_id
    validates :price
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
