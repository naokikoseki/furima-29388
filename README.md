# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル	
| Column           | Type        | Options    |	
|------------------|-------------|------------|	
| nickname         | string      |null: false |	
| family_name      | string      |null: false |	
| first_name       | string      |null: false |	
| family_name_kana | string      |null: false |	
| first_name_kana  | string      |null: false |	
| email            | string      |null: false |	
| password         | string      |null: false |	
| birthday         | date        |null: false |	

### Association	
- has_many :items	
- has_many :comments
- has_many :purchases

## commentsテーブル
| Column   | Type    | Options                      |
|----------|---------|------------------------------|
| comment  | text    |                              |
| item_id  | integer |null: false,foreign_key: true |
| user_id  | integer |null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
| Column          | Type        | Options                      |
|-----------------|-------------|------------------------------|
| name            | string      |null: false                   |
| price           | integer     |null: false                   |
| category_id     | integer     |null: false                   |
| status_id       | integer     |null: false                   |
| fee_id          | integer     |null: false                   |
| region_id       | integer     |null: false                   |
| shipment_day_id | integer     |null: false                   |
| explanation     | text        |null: false                   |
| user_id         | integer     |null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## addressテーブル
| Column        | Type    | Options                     |
|---------------|---------|-----------------------------|
| post_code     | string  |null: false                  |
| prefecture_id | integer |null: false                  |
| city          | string  |null: false                  |
| house_number  | string  |null: false                  |
| building_name | string  |                             |
| phone_number  | string  |null: false                  |
| purchase_id   | integer |null: false,foreign_key: true|

### Association
- belongs_to :purchase

## purchasesテーブル
| Column   | Type    | Options                      |
|----------|---------|------------------------------|
| item_id  | integer |null: false,foreign_key: true |
| user_id  | integer |null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address