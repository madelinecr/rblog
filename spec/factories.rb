FactoryGirl.define do
  factory :admin do |f|
    f.email                 "testuser@example.org"
    f.password              "password"
    f.password_confirmation "password"
  end

  factory :article do |f|
    f.title "Lorem ipsum dolor sit amet"
    f.body "consectetur adipiscing elit"
  end
end
