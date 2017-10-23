FactoryGirl.define do
  factory :user do
    short_name 'JD'
    surname 'Doe'
    first_name 'John'
    factory :sequenced_user do
      sequence(:short_name) {|n| "JD#{n}" }
    end

  end
end
