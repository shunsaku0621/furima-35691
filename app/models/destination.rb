class Destination < ApplicationRecord
  belongs_to :order

#バリデーション
  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A\d{11}\z/}
  end



  #ActiveHashのバリデーション
  validates :prefecture_id, numericality: { other_than: 1 }
end
