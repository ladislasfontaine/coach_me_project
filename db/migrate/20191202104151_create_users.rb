class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :phone_number
      t.string :address
      t.string :zip_code
      t.text :description
      t.boolean :is_admin, default: false
      t.belongs_to :city, index: true
      t.belongs_to :objective, index: true

      t.timestamps
    end
  end
end
