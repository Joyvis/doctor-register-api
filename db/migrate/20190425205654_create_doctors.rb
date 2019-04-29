class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.integer :crm, null: false
      t.string :phone, null: false
      t.timestamps
    end
  end
end
