class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :title,        null: false
      t.string :company,      null: false
      t.string :customer,     null: false
      t.date :date,           null: false
      t.string :place,        null: false
      t.text :purpose,        null: false
      t.integer :relation_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
