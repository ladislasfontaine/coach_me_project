class CreateSeances < ActiveRecord::Migration[5.2]
  def change
    create_table :seances do |t|
      t.belongs_to :coach, index: true
      t.belongs_to :user, index: true
      t.datetime :start_date
      t.integer :duration
      t.string :place
      t.timestamps
    end
  end
end
