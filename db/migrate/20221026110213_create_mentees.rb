class CreateMentees < ActiveRecord::Migration[7.0]
  def change
    create_table :mentees do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :description
      t.integer :phone_numer
      t.belongs_to :community, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
