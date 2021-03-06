class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true do      
    validates :nickname
    validates :birth
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
      validates :last_name
      validates :first_name 
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_kana
      validates :first_name_kana
    end
   end

  

   has_many :items
   has_many :orders
end
