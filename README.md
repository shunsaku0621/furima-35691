# テーブル設計

## users テーブル

| Column                    | Type   | Options                   |
| --------------------------| -------| ------------------------- |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| nickname                  | string | null: false               |
| last_name                 | string | null: false               |
| first_name                | string | null: false               |
| last_name_kana            | string | null: false               |
| first_name_kana           | string | null: false               |
| birth                     | date   | null: false               |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column         | Type         | Options                         |
| ---------------| ------------ | ------------------------------- |
| title          | string       | null: false                     |
| text           | text         | null: false                     |
| category_id    | integer      | null: false                     |
| status_id      | integer      | null: false                     |
| shipping_fee_id| integer      | null: false                     |
| prefecture_id  | integer      | null: false                     |
| delivery_id    | integer      | null: false                     |
| price          | integer      | null: false                     |
| user           | references   | null: false, foreign_key: true  |


### Association

- has_one :order
- belongs_to :user




## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :destination





## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_num      | string     | null: false                    |  
| prefecture_id | string     | null: false                    |  
| city          | string     | null: false                    |  
| address       | string     | null: false                    |  
| building      | string     |                                |  
| phone_num     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |



### Association

- belongs_to :order


