FactoryGirl.define do
  factory :user do
    email 'teste@email.com'
    password 'teste123'
    password_confirmation 'teste123'
  end
end
