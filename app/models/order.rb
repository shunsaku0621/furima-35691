class Order < ApplicationRecord

  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination


  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
