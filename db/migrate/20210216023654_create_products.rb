class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :pruduct_name,        null: false
      t.text       :pruduct_description, null: false
      t.integer    :price,               null: false
      t.references :user,                foreign_key: true
      t.integer    :category_id,         null: false
      t.integer    :product_state_id,    null: false
      t.integer    :freight_burden_id,   null: false
      t.integer    :area_id,             null: false
      t.integer    :lead_time_id,        null: false
      t.timestamps
    end
  end
end