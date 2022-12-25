FactoryBot.define do
  factory :credit do
    association :user
    association :dealer

    amount { Faker::Number.decimal(l_digits: (2..5).to_a.sample, r_digits: 2) }
    reference_number { [nil, Faker::Alphanumeric.alphanumeric(number: (5..20).to_a.sample)].sample }
    add_attribute(:method) { [nil, Credit::METHODS.sample].sample }
    redeemed { [true, false].sample }
    notes { [nil, Faker::Hipster.sentences(number: 1).join("")].sample }
    expires_at { [nil, Faker::Date.forward(days: 1000)].sample }
    never_expires { expires_at.nil? }
  end
end
