class Relation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新規顧客' },
    { id: 3, name: '既存顧客' }
  ]

  include ActiveHash::Associations
  has_many :appointments
  
end