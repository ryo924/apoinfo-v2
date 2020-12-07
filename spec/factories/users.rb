FactoryBot.define do
  factory :user do
    email { 'sample.sample@sample.com' }
    password = '1111aaaa'
    password { password }
    password_confirmation { password }
    name { '氏名' }
  end
end
