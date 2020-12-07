FactoryBot.define do
  factory :comment do
    text { 'コメント' }
    association :user
    association :appointment
  end
end
