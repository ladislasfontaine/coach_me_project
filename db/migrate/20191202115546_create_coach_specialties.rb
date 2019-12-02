class CreateCoachSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :coach_specialties do |t|
    	t.belongs_to :coach, index: true
    	t.belongs_to :specialty, index: true

      t.timestamps
    end
  end
end
