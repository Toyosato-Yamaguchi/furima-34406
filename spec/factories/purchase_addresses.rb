FactoryBot.define do
  factory :purchase_address do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code {'123-4567'}
    region_id { 2 }
    city { '東京都' }
    phone { '09012345678' }
    block {11-1}
    building { 'エンパイア・ステート・ビルディング' }
  end
end
