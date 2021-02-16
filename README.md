# README


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many: products
- has_many: purchases

## products テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| product_name           | string     | null: false       |
| product_description    | text       | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |
| category_id            | integer    | null: false       |
| freight_burden_id      | integer    | null: false       |
| area_id                | integer    | null: false       |
| lead_time_id           | integer    | null: false       |
| product_state_id       | integer    | null: false       |

### Association

- belongs_to: user
- has_one: purchases


## purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

### Association

- belongs_to: user
- belongs_to: product
- has_one: address

## Addresses テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| postal_code | string     | null: false       |
| city        | string     | null: false       |
| phone       | string     | null: false       |
| block       | string     | null: false       | 
| building    | string     |                   |
| region_id   | integer    | null: false       |
| purchase    | references | foreign_key: true |
### Association

- belongs_to: purchase












