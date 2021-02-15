FactoryBot.define do
  factory :user do
    person = Gimei.name
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    last_name             { person.last.kanji }
    first_name            { person.first.kanji }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2021-01-01') }
  end
end
