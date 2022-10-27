class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.belongs_to :relationship, null: false, foreign_key: true
      t.belongs_to :mentee, null: false, foreign_key: true
      t.string :description
      t.boolean :isRejected

      t.timestamps
    end
  end
end
