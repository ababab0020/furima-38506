# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kane    | string	| null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many   :items    
- has_many   :orders    

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column         | Type         | Options                           |
| --------       | ------       | -------------------------------   |
| zip_code	     |  string 	    |   null: false                     |
| prefecture_id  |  integer	    |   null: false                     |
| city	         |  string	    |   null: false                     |
| address1	     |  string	    |   null: false                     |
| address2	     |  string	    |                                   |
| telephone	     |  string	    |   null: false                     |
| order          | references   | null: false, foreign_key: true    |

### Association

- belongs_to :order

## items テーブル

| Column	           |  Type	    | Options                        |
| -------------------| ---------- | ------------------------------ |
| name               | string  	  | null: false                    |
| description        | text  	    | null: false                    |
| price              | integer 	  | null: false                    |
| item_condition_id  | integer    | null: false,                   |
| delivery_price_id  | integer    | null: false,                   |
| delivery_day_id    | integer    | null: false,                   |
| area_id            | integer    | null: false,                   |
| category_id        | integer    | null: false,                   |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

