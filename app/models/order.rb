class Order < ApplicationRecord
  attr_accessor :token

  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination

  #バリデーション
  with_options presence: true do
    validates :token
  end


  #ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
