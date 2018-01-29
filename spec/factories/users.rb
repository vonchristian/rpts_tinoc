FactoryBot.define do
  factory :user do
    sequence(:email) {|a| "#{a}@adasd#{a}.com" }
    password 'secret_password'
    password_confirmation 'secret_password'
  end
end
