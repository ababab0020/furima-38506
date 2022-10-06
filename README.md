# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------              |
| name               | string | null: false              |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kane    | string	| null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many   :items    
-     

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user

## address テーブル

| Column      | Type        | Options                           |
| --------    | ------      | -------------------------------   |
| user    	  |  references |   null: false, foreign_key: true  |
| zip_code	  |  integer	  |   null: false                     |
| prefecture  |  string	    |   null: false                     |
| city	      |  string	    |   null: false                     |
| address1	  |  string	    |   null: false                     |
| address2	  |  string	    |                                   |
| telephone	  |  string	    |   unique: true                    |

### Association
- has_many   :items
- belongs_to :user

## items テーブル

| Column	           |  Type	    | Options                        |
| -------------------| ---------- | -------------------------------
| name               | string  	  | null: false                    |
| description        | text  	    | null: false                    |
| price              | integer 	  | null: false                    |
| item_condition_id  | integer    | null: false, foreign_key: true |
| delivery_price_id  | integer    | null: false, foreign_key: true |
| delivery_days_id   | integer    | null: false, foreign_key: true |
| area_id_id         | integer    | null: false, foreign_key: true |
| category_id        | integer    | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :orders

