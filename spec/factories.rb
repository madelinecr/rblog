include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :admin do
    email                 "testuser@example.org"
    password              "password"
    password_confirmation "password"
  end

  factory :article do
    title "Lorem ipsum dolor sit amet"
    body "consectetur adipiscing elit"

    factory :article_with_header do
      header { fixture_file_upload(Rails.root.join('spec', 'factory_image.png'), 'image/png') }
    end
  end
end
