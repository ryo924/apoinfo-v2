class Profile < ApplicationRecord
  with_options presence: true do
    validates :customer_name
    validates :customer_occupation
  end

  belongs_to :appointment
end
