FactoryGirl.define do
  factory :user do
    first_name "Elizabeth"
    sequence(:last_name) { |i| "the #{i.ordinalize}" }
    sequence(:email) { |i| "Elizabeth#{i}@example.com" }
    secret_santa "Bob Dob"
  end
end
