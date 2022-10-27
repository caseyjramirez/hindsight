class CreateMentees < ActiveRecord::Migration[7.0]
  def change
    create_table :mentees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.integer :phone_number
      t.string :description
      t.belongs_to :community, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
