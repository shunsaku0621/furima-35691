
class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :address, :building, :phone_num, :user_id, :item_id, :token, :order_id
  


  #バリデーション
  with_options presence: true do
    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A\d{11}\z/}
    validates :user_id 
    validates :item_id 
    validates :token 
  end


  #ActiveHashのバリデーション
  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(post_num: post_num, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end
end