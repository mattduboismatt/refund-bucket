FactoryBot.define do
  factory :dealer do
    name { Faker::Company.name }
    category { Dealer::Categories::ALL.sample }
    slug { Faker::Internet.slug(words: name, glue: "-") + Faker::Alphanumeric.alpha(number: 10) }
  end

  trait :airline do
    category { Dealer::Categories::AIRLINE }
  end

  trait :hotel do
    category { Dealer::Categories::HOTEL }
  end
end
