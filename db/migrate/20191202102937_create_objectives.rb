# frozen_string_literal: true

class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.text :description

      t.timestamps
    end
  end
end
