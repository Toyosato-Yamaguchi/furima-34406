class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.string     :city,        null: false
      t.string     :phone,       null: false
      t.string     :block,       null: false
      t.string     :building
      t.integer    :region_id,   null: false
      t.references :purchase,    foreign_key: true
      t.timestamps
    end
  end
end
