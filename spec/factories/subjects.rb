FactoryBot.define do
  factory :subject do
    name { "MyString" }
    evaluation { :A }
    unit_value { 1 }

    trait :invalid do
      name { nil }
    end
  end
end
