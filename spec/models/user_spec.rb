require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it '要素がすべて存在すれば登録できる' do
        expect(@user).to be_valid
      end
      # it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      #   @user.password = 'aaaaaa'
      #   expect(@user).to be_valid
      # end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        binding.pry
      end
      it 'emailは、@を含む必要があること' do
      end
      it '重複したemailが存在する場合登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが英数字を含めないと登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'nicknameが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthが空では登録できない' do
      end
    end
  end
end
