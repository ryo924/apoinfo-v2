FactoryBot.define do
  factory :appointment do
    title {"タイトル"}
    company {"取引先名"}
    customer {"顧客名"}
    date {"2020-01-01"}
    place {"場所"}
    purpose {"目的"}
    relation_id {"2"}
    association :user
  end
end