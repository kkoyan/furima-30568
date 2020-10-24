# README

・アプリケーション名
　FURIMA

・アプリケーション概要
　誰でも簡単に出品・購入できる

・URL
　

・データベース設計

## users table

| Column                   | Type   | Options     |
|--------------------------|--------|-------------|
| nickname                 | string | null: false |
| e-mail                   | string | null: false |
| password                 | string | null: false |
| password_confirmation    | string | null: false |
| family_name              | string | null: false |
| first_name               | string | null: false |
| family_name_furikana     | string | null: false |
| first_name_furikana      | string | null: false |
| birthday                 | date   | null: false |

### Association

- has_many :items

## items table

| Column               | Type       | Options           |
|----------------------|------------|-------------------|
| user                 | references | foreign_key: true |
| product_name         | string     | null: false       |
| product_discription  | text       | null: false       |
| category_id          | integer    | null: false       |
| shipping_charge_id   | integer    | null: false       |
| shipping_area_id     | integer    | null: false       |
| shipping_days_id     | integer    | null: false       |
| price                | integer    | null: false       |

### Association

- belongs_to :users

## addresses table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| postal_code    | string     | null: false       |
| prefucture_id  | integer    | null: false       |
| city           | string     | null: false       |
| house_number   | string     | null: false       |
| building_name  | string     | null: false       |
| phone_number   | string     | null: false       |
| order          | references | foreign_key: true |

### Association

- belongs_to :orders

## orders table

| Column  | Type       | Options                         |
|---------|------------|---------------------------------|
| item    | references | null: false, foreign_key: true  |


### Association

- belongs_to :items