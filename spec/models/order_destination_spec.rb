require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numが空だと保存できないこと' do
        @order_destination.post_num = ''
        @order_destination.valid? 
        expect(@order_destination.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_num = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post num is invalid")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと保存できないこと' do
        @order_destination.phone_num = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone num can't be blank")
      end
      it '9桁以下では登録できないこと' do
        @order_destination.phone_num = '000000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone num is invalid")
      end
      it '12桁以上では登録できないこと' do
        @order_destination.phone_num = '111111111111'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone num is invalid")
      end
      it '英数混合では登録できないこと' do
        @order_destination.phone_num = 'ski234567k8'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが正しい形式でないと保存できないこと' do
        @order_destination.phone_num = '080-0000-0000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone num is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @order_destination.user_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_destination.item_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
