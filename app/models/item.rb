class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ActiveHashのバリデーション(ジャンルの選択が「--」の時は保存不可にするもの）
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :item_condition_id
    validates :delivery_price_id
    validates :delivery_day_id
  end

  #　テーブル間のアソシエーション
  belongs_to :user
  #has_one    :order

   # active_storageとのアソシエーション
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_condition
  belongs_to :delivery_price
  belongs_to :delivery_day

end
