class CreateDoctorSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_specialities do |t|
      t.belongs_to :doctor
      t.belongs_to :speciality
      t.timestamps
    end

    add_index :doctor_specialities, [:doctor_id, :speciality_id], unique: true
  end
end
