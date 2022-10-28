class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.belongs_to :posting, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :description
      t.boolean :isRejected
      t.boolean :isAccepted

      t.timestamps
    end
  end
end
