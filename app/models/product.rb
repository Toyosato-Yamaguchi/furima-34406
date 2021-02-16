class Product < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :price, numericality: { only_integer:true, greater_than:300, less_than:10000000}
  end


  belongs_to :user
  has_one   :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_state
  belongs_to :freight_burden
  belongs_to :area
  belongs_to :lead_time

  validates :category_id,       numericality: { other_than: 1 }
  validates :product_state_id,  numericality: { other_than: 1 }
  validates :freight_burden_id, numericality: { other_than: 1 }
  validates :area_id,           numericality: { other_than: 1 }
  validates :lead_time_id,      numericality: { other_than: 1 }
end
