# frozen_string_literal: true

class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.integer :siret
      t.string :phone_number
      t.string :address
      t.string :zip_code
      t.integer :price, default: 30
      t.string :account_number
      t.string :account_name
      t.boolean :reviewed, default: false
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
