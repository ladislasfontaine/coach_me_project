# frozen_string_literal: true

class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.integer :height
      t.float :weight
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
