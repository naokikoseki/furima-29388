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
|---------------------------------------------|
| nickname         | string      |null: false |
| family_name      | string      |null: false |
| first_name       | string      |null: false |
| family_name_kana | string      |null: false |
| first_name_kana  | string      |null: false |
| email            | string      |null: false |
| password         | string      |null: false |
| birth_year       | string      |null: false |
| birth_month      | string      |null: false |
| birth_day        | string      |null: false |

### Association
-has_many :items
-has_many :comments

## commentsテーブル
| Column   | Type    | Options                      |
|---------------------------------------------------|
| comment  | text    |                              |
| item_id  | integer |null: false,foreign_key: true |
| user_id  | integer |null: false,foreign_key: true |

### Association
-belongs_to :users
-belongs_to :items

## itemsテーブル
| Column       | Type        | Options                      |
|-----------------------------------------------------------|
| image        | string      |null: false                   |
| item_name    | string      |null: false                   |
| price        | string      |null: false                   |
| category     | string      |null: false                   |
| status       | string      |null: false                   |
| fee          | string      |null: false                   |
| region       | string      |null: false                   |
| shipment_day | string      |null: false                   |
| user_id      | integer     |null: false,foreign_key: true |

### Association
-belongs_to :users
-has_many :comments

## credit_cardテーブル
| Column           | Type    | Options                      |
|-----------------------------------------------------------|
| credit_number    | integer |null: false                   |
| expiration_year  | integer |null: false                   |
| expiration_month | integer |null: false                   |
| security_code    | integer |null: false                   |
| user_id          | integer |null: false,foreign_key: true |

### Association

## addressテーブル
| Column        | Type    | Options                     |
|-------------------------------------------------------|
| post_code     | integer |null: false                  |
| prefecture    | string  |null: false                  |
| city          | string  |null: false                  |
| house_number  | string  |null: false                  |
| building_name | string  |                             |
| phone_number  | integer |null: false                  |
| user_id       | integer |null: false,foreign_key: true|

### Association