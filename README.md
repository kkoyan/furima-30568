# README

・アプリケーション名
　FURIMA

・アプリケーション概要
　誰でも簡単に出品・購入できる

・クレジットサンプル
カード番号:4242424242424242
有効期限:12/24
CVC:123
　

・データベース設計

## users table

| Column                   | Type   | Options     |
|--------------------------|--------|-------------|
| nickname                 | string | null: false |
| email                    | string | null: false |
| encrypted_password       | string | null: false |
| family_name              | string | null: false |
| first_name               | string | null: false |
| family_name_furikana     | string | null: false |
| first_name_furikana      | string | null: false |
| birthday                 | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| user                 | references | foreign_key: true |
| name                 | string     | null: false       |
| discription          | text       | null: false       |
| category_id          | integer    | null: false       |
| condition_id         | integer    | null: false       |
| shipping_charge_id   | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| shipping_days_id     | integer    | null: false       |
| price                | integer    | null: false       |

### Association

- belongs_to :user
- has_one :order

## addresses table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal_code    | string     | null: false       |
| prefucture_id  | integer    | null: false       |
| city           | string     | null: false       |
| house_number   | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| order          | references | foreign_key: true |

### Association

- belongs_to :order

## orders table

| Column  | Type       | Options                         |
|---------|------------|---------------------------------|
| item    | references | null: false, foreign_key: true  |
| user    | references | null: false, foreign_key: true  |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address