# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | text   | null: false |
| first_name      | text   | null: false |
| last_name_kana  | text   | null: false |
| first_name_kana | text   | null: false |
| birth_year      | integer| null: false |
| birth_month     | integer| null: false |
| birth_day       | integer| null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column      | Type        | Options                         |
| ----------- | ----------- | ------------------------------- |
| title       | string      | null: false                     |
| text        | text        | null: false                     |
| category    | string      | null: false                     |
| status      | string      | null: false                     |
| shipping_fee| string      | null: false                     |
| prefecture  | string      | null: false                     |
| delivery    | string      | null: false                     |
| price       | integer     | null: false                     |
| tax         | integer     | null: false                     |
| profit      | integer     | null: false                     |
| user        | references  | null: false, foreign_key: true  |


### Association

- has_many :orders
- belongs_to :user


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| pay       | integer    | null: false                    |  
| number    | integer    | null: false                    |  
| month     | integer    | null: false                    |  
| year      | integer    | null: false                    |  
| cvc       | integer    | null: false                    |  
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item




## destinations テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| post_num  | integer    | null: false                    |  
| prefecture| string     | null: false                    |  
| city      | string     | null: false                    |  
| address   | string     | null: false                    |  
| building  | string     | null: false                    |  
| phone_num | integer    | null: false, foreign_key: true |
| order     | references | null: false, foreign_key: true |



### Association

- belongs_to :order

