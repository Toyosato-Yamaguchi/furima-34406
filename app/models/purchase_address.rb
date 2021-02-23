class PurchaseAddress

  include ActiveModel::Model
  attr_accessor  :user_id, :product_id, :postal_code, :city, :phone, :block, :building, :region_id, :token
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :phone,       format: { with: /\A\d{10,11}\z/ }
    validates :block
    validates :user_id
    validates :product_id
    validates :token
  end
  validates :region_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, city: city, phone: phone, block: block, building: building, region_id: region_id, purchase_id: purchase.id)
  end
end