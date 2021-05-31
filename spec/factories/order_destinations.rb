FactoryBot.define do
  factory :order_destination do
    post_num {'811-3303'}
    prefecture_id {5}
    city {'東京都緑区'}
    address {'1-2-2'}
    building {"柳ビル"}
    phone_num {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    # item_id {3}
  end
end
