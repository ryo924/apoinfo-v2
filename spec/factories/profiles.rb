FactoryBot.define do
  factory :profile do
    customer_name {"氏名"}
    customer_occupation {"所属"}
    position {"役職"}
    note {"備考"}
    association :appointment
  end
end