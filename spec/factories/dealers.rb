FactoryBot.define do
  factory :dealer do
    name { Faker::Company.name }
    category { Dealer::CATEGORIES.sample }
    slug { Faker::Internet.slug(words: name, glue: "-") }
  end
end
