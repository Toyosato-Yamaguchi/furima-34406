# README


## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        |        | Active hush |

### Association

- has_many: products
- has_many: purchases

## products テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| product_name        | string     | null: false       |
| product_description | text       | null: false       |
| price               | integer    | null: false       |
| user_id             | references | foreign_key: true |
| image               |            | Active storage    |
| category            |            | Active hush       |
| freight_burden      |            | Active hush       |
| area                |            | Active hush       |
| lead_time           |            | Active hush       |

### Association

- belongs_to: user
- has_one: purchase


## purchases テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user_id    | references | foreign_key: true |
| product_id | references | foreign_key: true |

### Association

- belongs_to: product
- has_one: address

## Addresses テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| postal_code | integer    | null: false       |
| city        | string     | null: false       |
| phone       | integer    | null: false       |
| purchase_id | references | foreign_key: true |
| region      |            | Active hush       |

### Association

- belongs_to: purchase











