# テーブル設計

## users テーブル

| Column                   | Type   | Options                   |
| ------------------------ | ------ | ------------------------- |
| nickname                 | string | null: false               |
| email                    | string | null: false, unique: true |
| encrypted_password       | string | null: false               |
| last_name                | string | null: false               |
| first_name               | string | null: false               |
| last_name_pronunciation  | string | null: false               |
| first_name_pronunciation | string | null: false               |
| birthday                 | date   | null: false               |

### Association

-has_many :items
-has_many :purchases


## items テーブル

| Column                         | Type       | Options                        |
| ------------------------------ | ---------- | ------------------------------ |
| name                           | string     | null: false                    |
| outline                        | text       | null: false                    |
| category_id                    | integer    | null: false                    |
| state_id                       | integer    | null: false                    | 
| postage_id                     | integer    | null: false                    |
| prefecture_id                  | integer    | null: false                    |
| waiting_days_until_shipment_id | integer    | null: false                    | 
| price                          | integer    | null: false                    |
| user                           | references | null: false, foreign_key: true |

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
-has_one :destination


## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase