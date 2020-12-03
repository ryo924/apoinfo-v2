class Relation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新規先' },
    { id: 3, name: '既往先' }
  ]

  include ActiveHash::Associations
  has_many :appointments
  
end