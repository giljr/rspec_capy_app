FactoryBot.define do
  factory :post do
    title  { Faker::Book.title }
    body   { Faker::Lorem.paragraphs(number: 2).join("\n") }
    views  { Faker::Number.between(from: 0, to: 100) }

association :user
  end
end