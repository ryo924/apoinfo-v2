class Appointment < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :company
    validates :customer
    validates :date
    validates :place
    validates :purpose
    validates :relation_id
  end

  validates :relation_id, numericality: { other_than: 1, message: 'を入力してください' }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :profiles, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :relation

  def self.search(search)
    if search != ''
      Appointment.where('company LIKE(?)', "%#{search}%")
    else
      Appointment.all
    end
  end
end
