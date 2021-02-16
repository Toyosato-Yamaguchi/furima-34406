class Category < ActiveHash::Base
  self.data = [
      { id: 1, nane: '---' },
      { id: 2, nane: 'レディース' },
      { id: 3, nane: 'メンズ' },
      { id: 4, nane: 'インテリア・住まい・小物' },
      { id: 5, nane: '本・音楽・ゲーム' },
      { id: 6, nane: 'おもちゃ・ホビー・グッズ' },
      { id: 7, nane: '家電・スマホ・ゲーム' },
      { id: 8, nane: 'スポーツ・レジャー' },
      { id: 9, nane: 'ハンドメイド' },
      { id: 10, nane: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :products
end