# テーブル設計

## card テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| customer_id | integer    | null:false                     |
| card_id     | integer    | null:false                     |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kane    | string	| null: false |
| birth_day          | date   | null: false |

### Association

- has_many   :comments
- has_many   :items    dependent: :destroy
- belongs_to :card     dependent: :destroy

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user

## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :user

## items テーブル

| Column	           |  Type	    | Options                        |
| -------------------| ---------- | -------------------------------
| name               | string  	  | null: false                    |
| description        | text  	    | null: false                    |
| price              | integer 	  | null: false                    |
| item_condition_id  | references | null: false, foreign_key: true |
| delivery_day_id    | references | null: false, foreign_key: true |
| delivery_way_id    | references | null: false, foreign_key: true |
| area_id            | references | null: false, foreign_key: true |
| category_id        | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- has_many   :item_image
- belongs_to :user
- belongs_to :item_condition
- belongs_to :delivery_day
- belongs_to :delivery_way
- belongs_to :area
- belongs_to :category

## item_image テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| item_image | string     | null: false                    |

### Association

- belongs_to :items

## item_condition テーブル

| Column         | Type       | Options                        |
| ---------      | ---------- | ------------------------------ |
| item_condition | string     | null: false                    |

### Association

- has_many :items

## delivery_day テーブル

| Column         | Type       | Options                        |
| ---------      | ---------- | ------------------------------ |
| delivery_day   | string     | null: false                    |

### Association

- has_many :items

## delivery_way テーブル

| Column         | Type       | Options                        |
| ---------      | ---------- | ------------------------------ |
| delivery_way   | string     | null: false                    |

### Association

- has_many :items

## area テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| area           | string     | null: false                    |

### Association

- has_many :items

## category テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| category       | string     | null: false                    |

### Association

- has_many :items

