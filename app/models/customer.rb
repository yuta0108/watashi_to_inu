class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
      validates :is_active
      validates :last_name
      validates :first_name
      validates :last_name_kana
      validates :first_name_kana
      validates :email
      validates :encrypted_password
      validates :phone_number
  end


  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
    # find_or_create_by: データの検索と作成を自動的に判断して処理を行う
      customer.password = SecureRandom.urlsafe_base64
      # SecureRandom.urlsafe_base64: ランダムな文字列を生成する
      customer.last_name = "太郎"
      customer.first_name = "ゲスト"
      customer.last_name_kana = "タロウ"
      customer.first_name_kana = "ゲスト"
      customer.phone_number = "000-0000-0000"
    end
  end

  def guest_customer?
    email == GUEST_CUSTOMER_EMAIL
  end

  has_many :cart_items, dependent: :destroy
  has_many :orders

  enum is_active: {active: true, non_active: false}
end
