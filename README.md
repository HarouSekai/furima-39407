# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| nickname                 | string | null: false |
| email                    | string | null: false |
| encrypted_password       | string | null: false |
| last_name                | string | null: false |
| first_name               | string | null: false |
| last_name_pronunciation  | string | null: false |
| first_name_pronunciation | string | null: false |
| birthday                 | date   | null: false |

### Association

-has_many :items
-has_many :purchases


## items テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| outline                     | text       | null: false                    |
| category                    | string     | null: false                    |
| state                       | string     | null: false                    | 
| postage                     | string     | null: false                    |
| shipping_origin             | string     | null: false                    |
| waiting_days_until_shipment | string     | null: false                    | 
| price                       | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase


## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item