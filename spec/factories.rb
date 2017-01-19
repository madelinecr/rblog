include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :admin do
    sequence(:email) {|n| "testuser#{n}@example.org" }
    password              "password"
    password_confirmation "password"
  end

  factory :article do
    title "Lorem ipsum dolor sit amet"
    body "consectetur adipiscing elit"

    factory :article_with_header do
      header { fixture_file_upload(Rails.root.join('spec', 'factory_image.png'), 'image/png') }
    end

    factory :article_with_photo do
      after(:create) do |article|
        create(:photo, article: article)
      end
    end
  end

  factory :photo do
    title "Desktop screenshot 1"
  end
end
